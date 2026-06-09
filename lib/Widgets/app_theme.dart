import 'package:flutter/material.dart';

class AppTheme {
  // Brand Palette
  static const Color background = Color(0xFF0F172A); // Slate 900
  static const Color surface = Color(0xFF1E293B);    // Slate 800
  static const Color cardBg = Color(0xFF334155);     // Slate 700
  
  static const Color primary = Color(0xFF6366F1);    // Indigo 500
  static const Color secondary = Color(0xFF06B6D4);  // Cyan 500
  static const Color accent = Color(0xFFEC4899);     // Pink 500
  
  static const Color correct = Color(0xFF10B981);    // Emerald 500
  static const Color incorrect = Color(0xFFEF4444);  // Red 500
  static const Color textLight = Color(0xFFF8FAFC);  // Slate 50
  static const Color textMuted = Color(0xFF94A3B8);  // Slate 400

  // Premium Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)], // Slate 900 to Deep Indigo
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF06B6D4)], // Indigo to Cyan
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFEC4899), Color(0xFF8B5CF6)], // Pink to Violet
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient correctGradient = LinearGradient(
    colors: [Color(0xFF34D399), Color(0xFF059669)], // Emerald Light to Dark
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient incorrectGradient = LinearGradient(
    colors: [Color(0xFFF87171), Color(0xFFDC2626)], // Red Light to Dark
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Modern Box Shadows
  static List<BoxShadow> get premiumShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ];

  static List<BoxShadow> get glowingPrimaryShadow => [
        BoxShadow(
          color: primary.withOpacity(0.4),
          blurRadius: 15,
          offset: const Offset(0, 4),
        ),
      ];

  // Custom Input Decoration
  static InputDecoration inputDecoration({
    required String labelText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: textMuted, fontSize: 16),
      prefixIcon: Icon(prefixIcon, color: primary),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: surface,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: surface, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: incorrect, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: incorrect, width: 2),
      ),
    );
  }
}
