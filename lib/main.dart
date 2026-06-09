import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_firebase_quiz_app/Views/login_screen.dart';
import 'package:flutter_firebase_quiz_app/Views/nav_bar_category_selection_screen.dart';
import 'package:flutter_firebase_quiz_app/firebase_options.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';
import 'Data/existing_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Upload questions to Firebase before running the app
  await uploadQuestionsToFirebase();

  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const NavBarCategorySelectionScreen();
            } else {
              return const LoginScreen();
            }
          }
          
          // Premium Startup Loading Screen
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppTheme.backgroundGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/quizdom_foreground.png",
                    height: 120,
                  ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.85, 0.85)),
                  const SizedBox(height: 24),
                  Text(
                    "QUIZDOM",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.textLight,
                      letterSpacing: 3,
                      shadows: [
                        Shadow(
                          color: AppTheme.secondary.withOpacity(0.35),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                  ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 8),
                  const Text(
                    "Unleash Your Knowledge",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.textMuted,
                      letterSpacing: 0.5,
                    ),
                  ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 50),
                  const CircularProgressIndicator(
                    color: AppTheme.secondary,
                  ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
