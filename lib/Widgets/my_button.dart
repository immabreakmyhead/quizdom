import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttontext;
  final Color? color;
  final Gradient? gradient;

  const MyButton({
    super.key,
    required this.onTap,
    required this.buttontext,
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: gradient ?? (color == null ? AppTheme.primaryGradient : null),
        color: gradient == null ? (color ?? AppTheme.primary) : null,
        boxShadow: color == null && gradient == null ? AppTheme.glowingPrimaryShadow : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Center(
              child: Text(
                buttontext,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
