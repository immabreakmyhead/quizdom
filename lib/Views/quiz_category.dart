import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/Views/quiz_screen.dart';

class QuizCategory extends StatefulWidget {
  const QuizCategory({super.key});

  @override
  State<QuizCategory> createState() => _QuizCategoryState();
}

class _QuizCategoryState extends State<QuizCategory> {
  // Reference to the Firestore collection that contains quiz categories
  final CollectionReference myCollection =
      FirebaseFirestore.instance.collection("QuestionsTest");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,// Avoids overlapping with bottom system UI
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: StreamBuilder(
          // Listen to live updates from Firestore
          stream: myCollection.snapshots(),
          builder: (context, snapshot) {
            // Show loading indicator while waiting for the data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Handle errors, empty data, or missing snapshot
            if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No categories found"),
              );
            }
            // Predefined colors for cards
            final List<Color> colors = [
              Colors.grey,
              Colors.blue,
              Colors.purpleAccent,
              Colors.orangeAccent,
              Colors.redAccent,
              Colors.indigoAccent,
              Colors.green,
            ];
            return GridView.builder(
                padding: const EdgeInsets.only(top: 80), //  Adds top spacing

              // Number of category cards
                itemCount: snapshot.data!.docs.length,

                // Grid layout: 2 columns, spacing between items
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 32,),
                itemBuilder: (context, index) {
                  // Get the Firestore document for this category
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return GestureDetector(
                    // Navigate to QuizScreen when tapping a category card
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
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      // Select card color based on index (looping with modulo)
                      color: colors[index % colors.length],
                      child: Column(
                        children: [
                          // Rounded image at the top of each card
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.network(
                              documentSnapshot['image_url'],
                              height: 130,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 4),

                          // Category title text
                          Text(
                            documentSnapshot['title'],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: const TextStyle(
                              height: 1.2,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
