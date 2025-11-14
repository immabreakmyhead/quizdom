import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/Views/nav_bar_category_selection_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/my_button.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestion;
  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestion,
  });

  // final update of score
  Future<void> updateUserScore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("userData").doc(user.uid);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userRef);

        if (!snapshot.exists) {
          throw Exception("User does not exit!");
        }
        int existingScore = snapshot['score'] ?? 0;
        transaction.update(userRef, {'score': existingScore + score});
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        title: const Text("Your Result"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Stack(
                children: [
                  Lottie.network(
                    "https://lottie.host/d7cc3291-7650-4c26-b9e0-4b8d0569a7ec/Epsc2qNzTb.json",
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Lottie.network(
                    "https://lottie.host/9dbdbe84-ce82-4ab4-8ca2-7f785d31b09a/YM78Royppj.json",
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                "Quiz Completed!",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Your score $score out of $totalQuestion",
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              // calculate the percentage
              Text(
                "${(score / totalQuestion * 100).toStringAsFixed(2)}%",
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 30),
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
                        buttontext: "Start New Quiz"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NavBarCategorySelectionScreen(
                                initialIndex: 1,
                              ),
                            ),
                            (route) => false,
                          );
                        },
                        buttontext: "Your Ranking"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
