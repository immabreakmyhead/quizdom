// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/Views/login_screen.dart';
import 'package:flutter_firebase_quiz_app/Widgets/my_button.dart';
import 'package:flutter_firebase_quiz_app/Widgets/snackbar.dart';
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
          // we don't have data that's why it show the loading indicator
          if (userData?['photoBase64'] != null) {
            profileImageBytes = base64Decode(userData!['photoBase64']);
          }
          isLoading = false;
        });
      }
    } catch (e) {
      print(e.toString());
      showSnackBAR(context, "Error fetching user data:$e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateProfileImage(Uint8List imageBytes) async {
    if (user == null) return;
    try {
      String base64Image = base64Encode(imageBytes);
      //ensure the photobase64 is only updated when non-null
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
      showSnackBAR(context, "Profile image updated successfully");
    } catch (e) {
      showSnackBAR(context, "Failed to update profiel iamge: $e");
    }
  }

// pick image from gallery
  Future<void> pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    // convert the image to bytes
    final imageBytes = await returnImage.readAsBytes();
    if (!mounted) return;
    // update profile image with the new image
    await updateProfileImage(imageBytes);
  }

  // for signout
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
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
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userData == null
              ? const Center(
                  child: Text("No user data found"),
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: pickImageFromGallery,
                        // keep in ming image size must bee less then 1MB
                        child: CircleAvatar(
                          backgroundColor: Colors.blue[100],
                          radius: 60,
                          backgroundImage: profileImageBytes != null
                              ? MemoryImage(profileImageBytes!)
                              : const NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")
                                  as ImageProvider,
                          child: const Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 16,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        userData?['name'],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Score : ${userData?['score'] * 102}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Divider(),
                      const SizedBox(height: 15),
                      // για να βαλω τις ερωτησεις
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: MyButton(
                      //           onTap: uploadQuestionsToFirebase, buttontext: "Sign Out"),
                      //     ),
                      //
                      //   ],
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                                onTap: signOut, buttontext: "Sign Out"),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
    );
  }
}
