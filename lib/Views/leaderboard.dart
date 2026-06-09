import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  Stream<List<Map<String, dynamic>>> getLeaderboardData() {
    return FirebaseFirestore.instance
        .collection('userData')
        .orderBy('score', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  String getShortName(String name) {
    return name.length > 10 ? "${name.substring(0, 8)}.." : name;
  }

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
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: getLeaderboardData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: AppTheme.primary),
              );
            }

            final users = snapshot.data ?? [];
            if (users.isEmpty) {
              return const Center(
                child: Text(
                  "No users found.",
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 16),
                ),
              );
            }

            final topThree = users.take(3).toList();
            final remainingUsers = users.skip(3).toList();

            return Column(
              children: [
                const SizedBox(height: 20),

                Text(
                  "Leaderboard",
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
                const SizedBox(height: 20),

                if (topThree.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        if (topThree.length >= 2)
                          _buildPodiumItem(topThree[1], 2, 100, context)
                              .animate()
                              .fadeIn(delay: 200.ms, duration: 400.ms)
                              .slideY(begin: 0.3, end: 0)
                        else
                          const SizedBox(width: 80),

                        _buildPodiumItem(topThree[0], 1, 130, context)
                            .animate()
                            .fadeIn(delay: 100.ms, duration: 500.ms)
                            .slideY(begin: 0.4, end: 0),

                        if (topThree.length >= 3)
                          _buildPodiumItem(topThree[2], 3, 85, context)
                              .animate()
                              .fadeIn(delay: 300.ms, duration: 400.ms)
                              .slideY(begin: 0.3, end: 0)
                        else
                          const SizedBox(width: 80),
                      ],
                    ),
                  ),

                const SizedBox(height: 24),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface.withOpacity(0.9),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withOpacity(0.05),
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: remainingUsers.isEmpty
                        ? const Center(
                            child: Text(
                              "Challenge others to climb up!",
                              style: TextStyle(color: AppTheme.textMuted),
                            ),
                          )
                        : ListView.separated(
                            itemCount: remainingUsers.length,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final user = remainingUsers[index];
                              final rank = index + 4;
                              return _buildListRow(user, rank, context)
                                  .animate(delay: (index * 50).ms)
                                  .fadeIn(duration: 350.ms)
                                  .slideY(begin: 0.1, end: 0);
                            },
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPodiumItem(
      Map<String, dynamic> user, int rank, double podiumHeight, BuildContext context) {
    Color medalColor;
    Color ringColor;
    String positionLabel;
    List<Color> podiumGradient;

    switch (rank) {
      case 1:
        medalColor = const Color(0xFFFFD700);
        ringColor = Colors.amber;
        positionLabel = "1st";
        podiumGradient = [const Color(0xFFFFD700), const Color(0xFFFFA500)];
        break;
      case 2:
        medalColor = const Color(0xFFC0C0C0);
        ringColor = Colors.grey.shade400;
        positionLabel = "2nd";
        podiumGradient = [const Color(0xFFE2E8F0), const Color(0xFF94A3B8)];
        break;
      default:
        medalColor = const Color(0xFFCD7F32);
        ringColor = Colors.amber.shade800;
        positionLabel = "3rd";
        podiumGradient = [const Color(0xFFD97706), const Color(0xFF78350F)];
    }

    final int displayScore = user['score'] ?? 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [

            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ringColor, width: 2.5),
                boxShadow: [
                  BoxShadow(
                    color: ringColor.withOpacity(0.25),
                    blurRadius: 15,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: CircleAvatar(
                radius: rank == 1 ? 38 : 30,
                backgroundColor: AppTheme.cardBg,
                backgroundImage: user['photoBase64'] != null
                    ? MemoryImage(base64Decode(user['photoBase64']))
                    : null,
                child: user['photoBase64'] == null
                    ? Icon(
                        Icons.person_rounded,
                        size: rank == 1 ? 36 : 28,
                        color: Colors.white60,
                      )
                    : null,
              ),
            ),

            if (rank == 1)
              const Positioned(
                top: -24,
                child: Icon(
                  Icons.emoji_events_rounded,
                  color: Colors.amber,
                  size: 26,
                ),
              ),

            Positioned(
              bottom: -8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: medalColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Text(
                  positionLabel,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 14),

        Text(
          getShortName(user['name'] ?? "User"),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 6),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "$displayScore pts",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: AppTheme.textLight,
            ),
          ),
        ),
        const SizedBox(height: 12),

        Container(
          width: 76,
          height: podiumHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: podiumGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, -4),
              )
            ],
          ),
          child: Center(
            child: Text(
              positionLabel,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.black.withOpacity(0.15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListRow(Map<String, dynamic> user, int rank, BuildContext context) {
    final int displayScore = user['score'] ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.04), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [

          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppTheme.cardBg,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textLight,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),

          CircleAvatar(
            radius: 20,
            backgroundColor: AppTheme.cardBg,
            backgroundImage: user['photoBase64'] != null
                ? MemoryImage(base64Decode(user['photoBase64']))
                : null,
            child: user['photoBase64'] == null
                ? const Icon(Icons.person_rounded, size: 20, color: Colors.white60)
                : null,
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Text(
              user['name'] ?? "User",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textLight,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.emoji_events_rounded, color: Colors.amber, size: 14),
                const SizedBox(width: 4),
                Text(
                  "$displayScore",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppTheme.textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
