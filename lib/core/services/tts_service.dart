import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class TtsService {
  final FlutterTts _flutterTts = FlutterTts();

  Future<String> speakToFile(String text, String langCode) async {
    // Définir la langue
    await _flutterTts.setLanguage(langCode);
    await _flutterTts.setSpeechRate(0.5);

    // Créer un chemin de fichier temporaire
    final dir = await getTemporaryDirectory();
    final filePath = "${dir.path}/${const Uuid().v4()}.wav";

    // Générer l'audio
    await _flutterTts.synthesizeToFile(text, filePath);

    return filePath;
  }
}
