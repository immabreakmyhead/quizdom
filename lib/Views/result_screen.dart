import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_firebase_quiz_app/Views/nav_bar_category_selection_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/my_button.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';
import 'package:flutter_firebase_quiz_app/Service/audio_service.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestion;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestion,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    // Play a clapping/celebration sound from web when results screen loads
    AudioService.playCelebration();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (widget.score / widget.totalQuestion) * 100;
    
    // Dynamic Encouragement Messages
    String statusTitle;
    String statusSubtitle;
    Color statusColor;

    if (percentage >= 80) {
      statusTitle = "Outstanding! 🏆";
      statusSubtitle = "You are a true master of this topic!";
      statusColor = AppTheme.correct;
    } else if (percentage >= 50) {
      statusTitle = "Great Job! 👍";
      statusSubtitle = "Keep up the great work, you're getting there!";
      statusColor = AppTheme.secondary;
    } else {
      statusTitle = "Keep Learning! 💪";
      statusSubtitle = "Practice makes perfect. Try again!";
      statusColor = AppTheme.accent;
    }

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.background,
        foregroundColor: AppTheme.textLight,
        title: const Text(
          "Quiz Results",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Celebration Lottie Stack
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.network(
                      "https://lottie.host/d7cc3291-7650-4c26-b9e0-4b8d0569a7ec/Epsc2qNzTb.json",
                      width: 280,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                    Lottie.network(
                      "https://lottie.host/9dbdbe84-ce82-4ab4-8ca2-7f785d31b09a/YM78Royppj.json",
                      width: 280,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ],
                ).animate().scale(duration: 400.ms, curve: Curves.bounceOut),
                const SizedBox(height: 20),

                // Feedback Message
                Text(
                  statusTitle,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ).animate().fadeIn(delay: 200.ms, duration: 300.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 8),
                Text(
                  statusSubtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppTheme.textMuted,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 300.ms, duration: 300.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 40),

                // Glassmorphic Score Card
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                  decoration: BoxDecoration(
                    color: AppTheme.surface.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                      width: 1.5,
                    ),
                    boxShadow: AppTheme.premiumShadow,
                  ),
                  child: Column(
                    children: [
                      // Radial animated percentage ring
                      TweenAnimationBuilder<double>(
                        duration: 1500.ms,
                        curve: Curves.fastOutSlowIn,
                        tween: Tween<double>(begin: 0, end: percentage / 100),
                        builder: (context, value, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 130,
                                height: 130,
                                child: CircularProgressIndicator(
                                  value: value,
                                  strokeWidth: 10,
                                  backgroundColor: AppTheme.cardBg,
                                  color: statusColor,
                                ),
                              ),
                              Text(
                                "${(value * 100).toStringAsFixed(1)}%",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textLight,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),

                      // Score Counter Label
                      Text(
                        "${widget.score} / ${widget.totalQuestion} Correct",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                )
                .animate().fadeIn(delay: 400.ms, duration: 500.ms).scale(begin: const Offset(0.95, 0.95)),
                const SizedBox(height: 40),

                // Bottom Action buttons
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NavBarCategorySelectionScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        buttontext: "Start New Quiz",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: MyButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NavBarCategorySelectionScreen(
                                initialIndex: 1, // Redirects straight to Leaderboard tab
                              ),
                            ),
                            (route) => false,
                          );
                        },
                        buttontext: "Leaderboard",
                        gradient: AppTheme.accentGradient, // Pink/Violet Gradient
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 600.ms, duration: 400.ms).slideY(begin: 0.15, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
