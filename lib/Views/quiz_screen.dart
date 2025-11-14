// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/Views/result_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/my_button.dart';

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

// to fetch the question
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
                ); // short by key
              var options = optionList.map((e) => e.value.toString()).toList();
              return {
                'questionText': q['questionText'] ?? "No Question",
                'options': options,
                'correctOptionKey':
                    int.tryParse(q['correctOptionKey'].toString()) ?? 0,
              };
            }).toList();
            // suffle and limit the question
            fetchedQuestions
                .shuffle(Random()); // it show the random question every time
            if (fetchedQuestions.length > 20) {
              fetchedQuestions = fetchedQuestions.sublist(0, 20);
            }
            setState(() => question = fetchedQuestions);
          }
        }
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // check the correct answer
  void _checkAnswer(int index) {
    setState(() {
      hasAnswered = true;
      selectedOption = index;
      if (question[currentIndex]['correctOptionKey'] == index + 1) {
        score++;
      }
    });
  }

  //for next question
  Future<void> _nextQuestion() async {
    if (currentIndex < question.length - 1) {
      setState(() {
        currentIndex++;
        hasAnswered = false;
        selectedOption = null;
      });
    } else {
      await _updateUserScore();
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
      debugPrint('error updatin score $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (question.isEmpty) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: const Center(
          child: Text("No Questions Available"),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentIndex + 1) / question.length,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blueAccent,
              minHeight: 8,
            ),
            const SizedBox(height: 20),
            // for question
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]),
              child: Text(
                question[currentIndex]['questionText'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //for option list
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return _buildOption(index);
                },
                separatorBuilder: (_, __) => const SizedBox(height: 15),
                itemCount: question[currentIndex]['options'].length,
              ),
            ),
            // conditionally render the next/finish button
            if (hasAnswered)
              MyButton(
                onTap: _nextQuestion,
                buttontext:
                    currentIndex == question.length - 1 ? "Finish" : "Next",
              ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index) {
    bool isCorrect = question[currentIndex]['correctOptionKey'] == index + 1;
    bool isSelected = selectedOption == index;
    Color bgColor = hasAnswered
        ? (isCorrect
            ? Colors.green.shade300
            : isSelected
                ? Colors.red.shade300
                : Colors.grey.shade200)
        : Colors.grey.shade200;
    Color textColor =
        hasAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black;
    return InkWell(
      onTap: hasAnswered ? null : () => _checkAnswer(index),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ]),
        child: Text(
          question[currentIndex]['options'][index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: textColor,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      foregroundColor: Colors.white,
      title: Text(
          "${widget.categoryName} (${currentIndex + 1}/${question.length})"),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
    );
  }
}
