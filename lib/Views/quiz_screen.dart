import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_firebase_quiz_app/Views/result_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/my_button.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';
import 'package:flutter_firebase_quiz_app/Service/audio_service.dart';

class QuizScreen extends StatefulWidget {
  final String categoryName;
  const QuizScreen({super.key, required this.categoryName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> question = [];
  int currentIndex = 0, score = 0;
  int? selectedOption;
  bool hasAnswered = false, isLoading = true;

  @override
  void initState() {
    _fetchQuestions();
    super.initState();
  }

  Future<void> _fetchQuestions() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("QuestionsTest")
          .doc(widget.categoryName)
          .get();

      if (snapshot.exists) {
        var data = snapshot.data();
        if (data != null && data.containsKey("questions")) {
          var questionMap = data['questions'];

          if (questionMap is Map<String, dynamic>) {
            var fetchedQuestions = questionMap.entries.map((entry) {
              var q = entry.value;
              var optionsMap = q['options'] as Map<String, dynamic>;
              var optionList = optionsMap.entries.toList()
                ..sort(
                  (a, b) => int.parse(a.key).compareTo(
                    int.parse(b.key),
                  ),
                );
              var options = optionList.map((e) => e.value.toString()).toList();
              return {
                'questionText': q['questionText'] ?? "No Question",
                'options': options,
                'correctOptionKey':
                    int.tryParse(q['correctOptionKey'].toString()) ?? 0,
              };
            }).toList();

            fetchedQuestions.shuffle(Random());
            if (fetchedQuestions.length > 20) {
              fetchedQuestions = fetchedQuestions.sublist(0, 20);
            }
            setState(() => question = fetchedQuestions);
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _checkAnswer(int index) {
    final bool isCorrect = question[currentIndex]['correctOptionKey'] == index + 1;
    setState(() {
      hasAnswered = true;
      selectedOption = index;
      if (isCorrect) {
        score++;
      }
    });
    
    // Play correct/incorrect sound effects
    if (isCorrect) {
      AudioService.playCorrect();
    } else {
      AudioService.playIncorrect();
    }
  }

  Future<void> _nextQuestion() async {
    if (currentIndex < question.length - 1) {
      setState(() {
        currentIndex++;
        hasAnswered = false;
        selectedOption = null;
      });
    } else {
      await _updateUserScore();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestion: question.length,
          ),
        ),
      );
    }
  }

  Future<void> _updateUserScore() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    try {
      var userRef =
          FirebaseFirestore.instance.collection("userData").doc(user.uid);
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        var snapshot = await transaction.get(userRef);
        if (!snapshot.exists) return;
        int existingScore = snapshot['score'] ?? 0;
        transaction.update(userRef, {'score': existingScore + score});
      });
    } catch (e) {
      debugPrint('Error updating score: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: AppTheme.background,
        body: const Center(
          child: CircularProgressIndicator(color: AppTheme.primary),
        ),
      );
    }
    if (question.isEmpty) {
      return Scaffold(
        backgroundColor: AppTheme.background,
        appBar: _buildAppBar(),
        body: const Center(
          child: Text(
            "No Questions Available",
            style: TextStyle(color: AppTheme.textMuted, fontSize: 16),
          ),
        ),
      );
    }

    double progress = (currentIndex + 1) / question.length;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                // Animate Progress Bar using TweenAnimationBuilder for smooth glide
                TweenAnimationBuilder<double>(
                  duration: 400.ms,
                  curve: Curves.easeInOut,
                  tween: Tween<double>(begin: 0, end: progress),
                  builder: (context, value, child) {
                    return Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            widthFactor: value,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: AppTheme.primaryGradient,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),

                // Question Card (Glassmorphic Container)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.surface.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                      width: 1.5,
                    ),
                    boxShadow: AppTheme.premiumShadow,
                  ),
                  child: Text(
                    question[currentIndex]['questionText'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textLight,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                .animate(key: ValueKey(currentIndex))
                .fadeIn(duration: 400.ms)
                .scale(begin: const Offset(0.95, 0.95)),
                const SizedBox(height: 30),

                // Options List
                Expanded(
                  child: ListView.separated(
                    itemCount: question[currentIndex]['options'].length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return _buildOption(index);
                    },
                  ),
                ),

                // Animated Next/Finish Button
                if (hasAnswered)
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: MyButton(
                      onTap: _nextQuestion,
                      buttontext: currentIndex == question.length - 1
                          ? "Finish"
                          : "Next Question",
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .scale(begin: const Offset(0.95, 0.95)),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOption(int index) {
    bool isCorrect = question[currentIndex]['correctOptionKey'] == index + 1;
    bool isSelected = selectedOption == index;

    // Determine colors based on states
    Gradient? optionGradient;
    Color borderCol = Colors.white.withOpacity(0.08);

    if (hasAnswered) {
      if (isCorrect) {
        optionGradient = AppTheme.correctGradient;
        borderCol = Colors.transparent;
      } else if (isSelected) {
        optionGradient = AppTheme.incorrectGradient;
        borderCol = Colors.transparent;
      } else {
        optionGradient = LinearGradient(
          colors: [AppTheme.surface.withOpacity(0.4), AppTheme.surface.withOpacity(0.4)],
        );
      }
    } else {
      optionGradient = const LinearGradient(
        colors: [AppTheme.surface, AppTheme.surface],
      );
    }

    Color textColor = hasAnswered
        ? (isCorrect || isSelected ? Colors.white : AppTheme.textMuted)
        : AppTheme.textLight;

    Widget optionCard = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        gradient: optionGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderCol,
          width: 1.5,
        ),
        boxShadow: hasAnswered && (isCorrect || isSelected)
            ? [
                BoxShadow(
                  color: (isCorrect ? AppTheme.correct : AppTheme.incorrect)
                      .withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ]
            : AppTheme.premiumShadow,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              question[currentIndex]['options'][index],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
          if (hasAnswered && (isCorrect || isSelected))
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Icon(
                isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                color: Colors.white,
                size: 20,
              ),
            )
        ],
      ),
    );

    // Dynamic animation based on choice accuracy
    if (hasAnswered && isSelected) {
      optionCard = optionCard
          .animate()
          .scale(begin: const Offset(0.97, 0.97), duration: 200.ms, curve: Curves.elasticOut);
      if (!isCorrect) {
        // Shake animation for incorrect answer
        optionCard = optionCard.animate().shake(hz: 8, duration: 350.ms, offset: const Offset(4, 0));
      }
    }

    return InkWell(
      onTap: hasAnswered ? null : () => _checkAnswer(index),
      borderRadius: BorderRadius.circular(16),
      child: optionCard,
    )
    .animate(key: ValueKey("option_$currentIndex" "_$index"))
    .fadeIn(delay: (index * 60).ms, duration: 300.ms)
    .slideX(begin: 0.1, end: 0);
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppTheme.background,
      foregroundColor: AppTheme.textLight,
      title: Text(
        "${widget.categoryName} (${currentIndex + 1}/${question.length})",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
