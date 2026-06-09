import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_firebase_quiz_app/Views/quiz_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';

class QuizCategory extends StatefulWidget {
  const QuizCategory({super.key});

  @override
  State<QuizCategory> createState() => _QuizCategoryState();
}

class _QuizCategoryState extends State<QuizCategory> {
  final CollectionReference myCollection =
      FirebaseFirestore.instance.collection("QuestionsTest");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppTheme.backgroundGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Beautiful Header Title
              Text(
                "Choose Category",
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
                  ],
                ),
              ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, end: 0),
              const SizedBox(height: 6),
              const Text(
                "Test your knowledge across various topics!",
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.textMuted,
                ),
              ).animate().fadeIn(delay: 100.ms, duration: 400.ms).slideY(begin: -0.2, end: 0),
              const SizedBox(height: 24),
              
              // Categories Grid
              Expanded(
                child: StreamBuilder(
                  stream: myCollection.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.primary,
                        ),
                      );
                    }

                    if (snapshot.hasError ||
                        !snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          "No categories found",
                          style: TextStyle(color: AppTheme.textMuted, fontSize: 16),
                        ),
                      );
                    }

                    final List<LinearGradient> cardGradients = [
                      const LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)], // Blue
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      const LinearGradient(
                        colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)], // Purple
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      const LinearGradient(
                        colors: [Color(0xFFEF4444), Color(0xFFB91C1C)], // Red
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      const LinearGradient(
                        colors: [Color(0xFFF59E0B), Color(0xFFD97706)], // Orange
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      const LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF047857)], // Emerald Green
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      const LinearGradient(
                        colors: [Color(0xFFEC4899), Color(0xFFBE185D)], // Pink
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ];

                    return GridView.builder(
                      padding: const EdgeInsets.only(bottom: 24),
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.82,
                      ),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        final gradient = cardGradients[index % cardGradients.length];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                  categoryName: documentSnapshot['title'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: gradient,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: AppTheme.premiumShadow,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      // Top Image
                                      Expanded(
                                        child: ShaderMask(
                                          shaderCallback: (rect) {
                                            return LinearGradient(
                                              colors: [Colors.black.withOpacity(0.85), Colors.transparent],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                                          },
                                          blendMode: BlendMode.dstIn,
                                          child: Image.network(
                                            documentSnapshot['image_url'],
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) =>
                                                Container(
                                                  color: Colors.black12,
                                                  child: const Icon(
                                                    Icons.image_not_supported_rounded,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                          ),
                                        ),
                                      ),
                                      
                                      // Bottom Title Label
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
                                        child: Text(
                                          documentSnapshot['title'],
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            height: 1.2,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .animate(delay: (index * 80).ms)
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.15, end: 0)
                        .scale(begin: const Offset(0.95, 0.95));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
