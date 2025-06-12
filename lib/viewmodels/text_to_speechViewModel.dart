import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../data/models/text_speech_model.dart';

class AudioViewModel extends ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();

  List<AudioMessage> _audioMessages = [];
  List<AudioMessage> get audioMessages => _audioMessages;

  int? _playingIndex;
  int? get playingIndex => _playingIndex;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  AudioViewModel() {

    _flutterTts.setStartHandler(() {
      _isPlaying = true;
      notifyListeners();
    });
    _flutterTts.setCompletionHandler(() {
      _isPlaying = false;
      _playingIndex = null;
      notifyListeners();
    });
    _flutterTts.setPauseHandler(() {
      _isPlaying = false;
      notifyListeners();
    });
    _flutterTts.setCancelHandler(() {
      _isPlaying = false;
      _playingIndex = null;
      notifyListeners();
    });
  }
  Future<bool> isLanguageAvailable(String languageCode) async {
    final languages = await _flutterTts.getLanguages;
    return languages.contains(languageCode);
  }
  Future<void> addAudioMessage(String text, String lang) async {
    if (text.trim().isEmpty) return;

    final message = AudioMessage(text: text.trim(), languageCode: lang, );
    _audioMessages.add(message);
    notifyListeners();
  }

  Future<void> playAudio(int index) async {
    if (index < 0 || index >= _audioMessages.length) return;

    final msg = _audioMessages[index];

    final isAvailable = await isLanguageAvailable(msg.languageCode);
    if (!isAvailable) {
      await _flutterTts.setLanguage('fr-FR');
      final currentLanguage = await _flutterTts.getLanguages;
      print('Current TTS Language: $currentLanguage');

    } else {
      await _flutterTts.setLanguage(msg.languageCode);
    }

    // Debug logs

    if (_playingIndex == index && _isPlaying) {
      await pause();
      return;
    } else if (_playingIndex == index && !_isPlaying) {
      await resume();
      return;
    }

    _playingIndex = index;
    _isPlaying = true;
    notifyListeners();

    await _flutterTts.speak(msg.text);
  }


  Future<void> pause() async {
    await _flutterTts.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> resume() async {
    if (_playingIndex == null) return;
    await _flutterTts.speak(_audioMessages[_playingIndex!].text);
    _isPlaying = true;
    notifyListeners();
  }

  Future<void> stop() async {
    await _flutterTts.stop();
    _isPlaying = false;
    _playingIndex = null;
    notifyListeners();
  }


  void downloadAudio(int index) {
    // Implémentation téléchargement
  }

  void deleteAudio(int index) {
    audioMessages.removeAt(index);
    notifyListeners();
  }

  Future<void> shareAudio(int index) async {
    if (index < 0 || index >= _audioMessages.length) return;

    final msg = _audioMessages[index];
    final filePath = msg.audioFilePath;

    if (filePath != null && File(filePath).existsSync()) {
      // Partage du fichier audio avec texte
      await Share.shareFiles([filePath], text: msg.text, subject: 'Audio message');
    } else {
      // Si pas de fichier, partage seulement le texte
      await Share.share(msg.text, subject: 'Audio message');
    }
  }
}




