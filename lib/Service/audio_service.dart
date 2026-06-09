import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioService {
  static final AudioPlayer _correctPlayer = AudioPlayer();
  static final AudioPlayer _incorrectPlayer = AudioPlayer();
  static final AudioPlayer _celebrationPlayer = AudioPlayer();

  // Local asset paths (audioplayers automatically defaults its search directory to 'assets/')
  static const String _correctPath = "correct.mp3";
  static const String _incorrectPath = "wrong.mp3";
  static const String _celebrationPath = "clapping.mp3";

  static Future<void> playCorrect() async {
    try {
      await _correctPlayer.stop();
      await _correctPlayer.play(AssetSource(_correctPath));
    } catch (e) {
      debugPrint("Error playing correct sound: $e");
    }
  }

  static Future<void> playIncorrect() async {
    try {
      await _incorrectPlayer.stop();
      await _incorrectPlayer.play(AssetSource(_incorrectPath));
    } catch (e) {
      debugPrint("Error playing incorrect sound: $e");
    }
  }

  static Future<void> playCelebration() async {
    try {
      await _celebrationPlayer.stop();
      await _celebrationPlayer.play(AssetSource(_celebrationPath));
    } catch (e) {
      debugPrint("Error playing celebration sound: $e");
    }
  }

  // Dispose players to release system resources when app closes
  static void dispose() {
    _correctPlayer.dispose();
    _incorrectPlayer.dispose();
    _celebrationPlayer.dispose();
  }
}
