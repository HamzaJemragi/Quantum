import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class TtsService {
  final String apiKey = '5a6ba62655984add82c2e84bda3c35ec'; // Put your real key here

  Future<File?> getTtsFile(String text, {String lang = 'fr-fr'}) async {
    final url = Uri.parse(
      'https://api.voicerss.org/?key=$apiKey&hl=$lang&src=${Uri.encodeComponent(text)}&c=MP3&f=44khz_16bit_stereo',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/tts_${DateTime.now().millisecondsSinceEpoch}.mp3';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return file;
    } else {
      print('TTS Error: ${response.statusCode} ${response.body}');
      return null;
    }
  }
}

