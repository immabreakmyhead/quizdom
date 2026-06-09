import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_firebase_quiz_app/Service/auth_service.dart';
import 'package:flutter_firebase_quiz_app/Views/nav_bar_category_selection_screen.dart';
import 'package:flutter_firebase_quiz_app/Views/signup_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/my_button.dart';
import 'package:flutter_firebase_quiz_app/Widgets/snackbar.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordHidden = true;
  final AuthService _authService = AuthService();

  void _login() async {
    if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      showSnackBAR(context, "Please fill in all fields");
      return;
    }

    setState(() {
      isLoading = true;
    });

    final result = await _authService.loginUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;

    if (result == "success") {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavBarCategorySelectionScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBAR(context, "Login Failed: $result");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 20),

                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.15),
                        blurRadius: 30,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/userlogin.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.8, 0.8)),
                const SizedBox(height: 30),

                Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textLight,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]
                  ),
                ).animate().fadeIn(delay: 100.ms, duration: 400.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 8),
                const Text(
                  "Login to test your knowledge",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.textMuted,
                  ),
                ).animate().fadeIn(delay: 200.ms, duration: 400.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.surface.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                      width: 1,
                    ),
                    boxShadow: AppTheme.premiumShadow,
                  ),
                  child: Column(
                    children: [

                      TextField(
                        controller: emailController,
                        style: const TextStyle(color: AppTheme.textLight),
                        keyboardType: TextInputType.emailAddress,
                        decoration: AppTheme.inputDecoration(
                          labelText: "Email Address",
                          prefixIcon: Icons.email_rounded,
                        ),
                      ).animate().fadeIn(delay: 300.ms, duration: 400.ms).slideX(begin: -0.1, end: 0),
                      const SizedBox(height: 20),

                      TextField(
                        controller: passwordController,
                        style: const TextStyle(color: AppTheme.textLight),
                        obscureText: isPasswordHidden,
                        decoration: AppTheme.inputDecoration(
                          labelText: "Password",
                          prefixIcon: Icons.lock_rounded,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },
                            icon: Icon(
                              isPasswordHidden
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: AppTheme.textMuted,
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 400.ms, duration: 400.ms).slideX(begin: -0.1, end: 0),
                      const SizedBox(height: 30),

                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppTheme.primary,
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: AppTheme.primaryGradient,
                                boxShadow: AppTheme.glowingPrimaryShadow,
                              ),
                              child: MyButton(
                                onTap: _login,
                                buttontext: "Login",
                                color: Colors.transparent,
                              ),
                            ).animate().fadeIn(delay: 500.ms, duration: 400.ms).scale(begin: const Offset(0.95, 0.95)),
                    ],
                  ),
                ).animate().fadeIn(delay: 250.ms, duration: 500.ms).slideY(begin: 0.1, end: 0),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.textMuted,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Signup here",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.secondary,
                        ),
                      ),
                    )
                  ],
                ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
