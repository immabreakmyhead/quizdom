import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

// now we have add the more user and lets seel how is it look
  String getShortName(String name) {
    return name.length > 7 ? name.substring(0, 7) : name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: getLeaderboardData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final users = snapshot.data!;
            if (users.isEmpty) {
              return const Center(
                child: Text("No users found."),
              );
            }
            final topThree = users.take(3).toList();
            final remainingUser = users.skip(3).toList();
            return Column(
              children: [
                // top 3 user
                Stack(
                  children: [
                    Image.asset(
                      "assets/leaderboard.png",
                      width: double.maxFinite,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      top: 72,
                      left: 88,
                      child: Text(
                        "Leader      board",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // currently we have only one user, we will add more user later
                    if (topThree.isNotEmpty) // or topthree.lenth >=1
                      Positioned(
                        top: 175,
                        right: 50,
                        left: 50,
                        child: _buildTopUser(topThree[0], 1, context),
                      ),
                    if (topThree.length >= 2)
                      Positioned(
                        top: 240,
                        left: 25,
                        child: _buildTopUser(topThree[1], 2, context),
                      ),
                    if (topThree.length >= 3)
                      Positioned(
                        top: 265,
                        right: 30,
                        child: _buildTopUser(topThree[2], 3, context),
                      ),
                  ],
                ),
                // remaining users list
                Expanded(
                  child: ListView.builder(
                    itemCount: remainingUser.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final user = remainingUser[index];
                      final rank = index + 4;
                      return _buildRegularUser(user, rank, context);
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget _buildTopUser(
      Map<String, dynamic> user, int rank, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          CircleAvatar(
              radius: rank == 1 ? 40 : 30,
              backgroundImage: user['photoBase64'] != null
                  ? MemoryImage(
                      base64Decode(user['photoBase64']),
                    )
                  : null,
              child: user['photoBase64'] == null
                  ? const Icon(
                      Icons.person,
                      size: 30,
                    )
                  : null),
          const SizedBox(height: 10),
          // for name
          Center(
              child: rank == 1
                  ? Text(
                      user['name'],
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      getShortName(
                        user['name'],
                      ),
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
          const SizedBox(height: 5),
          Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "👍",
                  style: TextStyle(fontSize: 19),
                ),
                const SizedBox(width: 5),
                Text(
                  "${user['score'] * 102}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegularUser(
      Map<String, dynamic> user, int rank, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          // Rank Number
          Text(
            '$rank',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 12),
          // Avatar
          CircleAvatar(
            radius: 25,
            backgroundImage: user['photoBase64'] != null
                ? MemoryImage(base64Decode(user['photoBase64']))
                : null,
            child: user['photoBase64'] == null
                ? const Icon(Icons.person, size: 20)
                : null,
          ),
          const SizedBox(width: 16),

          // name of user
          Text(
            user['name'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          // Total Points

          Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "👍",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${user['score'] * 101}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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