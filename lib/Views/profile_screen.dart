import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_firebase_quiz_app/Views/login_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/my_button.dart';
import 'package:flutter_firebase_quiz_app/Widgets/snackbar.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = true;
  Map<String, dynamic>? userData;
  Uint8List? profileImageBytes;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    if (user == null) return;
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("userData")
          .doc(user!.uid)
          .get();
      if (documentSnapshot.exists) {
        setState(() {
          userData = documentSnapshot.data() as Map<String, dynamic>?;
          if (userData?['photoBase64'] != null) {
            profileImageBytes = base64Decode(userData!['photoBase64']);
          }
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      if (mounted) {
        showSnackBAR(context, "Error fetching user data: $e");
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateProfileImage(Uint8List imageBytes) async {
    if (user == null) return;
    try {
      String base64Image = base64Encode(imageBytes);
      await FirebaseFirestore.instance
          .collection("userData")
          .doc(user!.uid)
          .set(
        {"photoBase64": base64Image},
        SetOptions(merge: true),
      );
      setState(() {
        profileImageBytes = imageBytes;
      });
      if (mounted) {
        showSnackBAR(context, "Profile image updated successfully");
      }
    } catch (e) {
      if (mounted) {
        showSnackBAR(context, "Failed to update profile image: $e");
      }
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final returnImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 60,
      );
      if (returnImage == null) return;
      final imageBytes = await returnImage.readAsBytes();
      if (!mounted) return;
      await updateProfileImage(imageBytes);
    } catch (e) {
      debugPrint("Error picking image: $e");
      if (mounted) {
        showSnackBAR(context, "Error picking image: $e");
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppTheme.primary),
                )
              : userData == null
                  ? const Center(
                      child: Text(
                        "No user data found",
                        style: TextStyle(color: AppTheme.textMuted),
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),

                          Text(
                            "My Profile",
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
                          ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 30),

                          GestureDetector(
                            onTap: pickImageFromGallery,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppTheme.secondary, width: 3),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppTheme.secondary.withOpacity(0.2),
                                        blurRadius: 20,
                                        spreadRadius: 4,
                                      )
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: AppTheme.surface,
                                    backgroundImage: profileImageBytes != null
                                        ? MemoryImage(profileImageBytes!)
                                        : const NetworkImage(
                                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")
                                            as ImageProvider,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_rounded,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                                 .scale(begin: const Offset(0.95, 0.95), end: const Offset(1.05, 1.05), duration: 1000.ms),
                              ],
                            ),
                          ).animate().fadeIn(delay: 100.ms, duration: 400.ms).scale(begin: const Offset(0.9, 0.9)),
                          const SizedBox(height: 20),

                          Text(
                            userData?['name'] ?? "User",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textLight,
                            ),
                          ).animate().fadeIn(delay: 200.ms, duration: 300.ms),
                          const SizedBox(height: 30),

                          _buildStatsGrid()
                              .animate()
                              .fadeIn(delay: 300.ms, duration: 450.ms)
                              .slideY(begin: 0.1, end: 0),
                          const SizedBox(height: 24),

                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppTheme.surface.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.06),
                                width: 1,
                              ),
                              boxShadow: AppTheme.premiumShadow,
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.email_rounded, color: AppTheme.secondary),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email Address",
                                        style: TextStyle(
                                          color: AppTheme.textMuted,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        userData?['email'] ?? "Not available",
                                        style: const TextStyle(
                                          color: AppTheme.textLight,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).animate().fadeIn(delay: 400.ms, duration: 400.ms).slideY(begin: 0.1, end: 0),
                          const SizedBox(height: 40),

                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: MyButton(
                              onTap: signOut,
                              buttontext: "Sign Out",
                              gradient: AppTheme.incorrectGradient,
                            ),
                          ).animate().fadeIn(delay: 500.ms, duration: 400.ms).scale(begin: const Offset(0.95, 0.95)),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    final int rawScore = userData?['score'] ?? 0;
    final int displayScore = rawScore * 100;
    final int level = (rawScore / 5).floor() + 1;
    final String rank = rawScore > 50
        ? "Grandmaster"
        : rawScore > 20
            ? "Pro Builder"
            : "Quiz Novice";

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard(
          title: "Total Points",
          value: "$displayScore",
          icon: Icons.emoji_events_rounded,
          color: Colors.amber,
        ),
        _buildStatCard(
          title: "Current Level",
          value: "Lvl $level",
          icon: Icons.bolt_rounded,
          color: AppTheme.secondary,
        ),
        _buildStatCard(
          title: "Rank Title",
          value: rank,
          icon: Icons.shield_rounded,
          color: Colors.purpleAccent,
        ),
        _buildStatCard(
          title: "Correct Answers",
          value: "$rawScore",
          icon: Icons.check_circle_rounded,
          color: AppTheme.correct,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
        boxShadow: AppTheme.premiumShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textLight,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
