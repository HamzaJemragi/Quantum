import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio WhatsApp Style',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioPage(),
    );
  }
}

class AudioPage extends StatefulWidget {
  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final TextEditingController _controller = TextEditingController();
  final FlutterTts _flutterTts = FlutterTts();

  String currentText = "";
  bool isAudioReady = false;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setCancelHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setPauseHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  Future<void> _speak() async {
    if (currentText.isNotEmpty) {
      await _flutterTts.setLanguage("fr-FR");
      await _flutterTts.setSpeechRate(0.5);
      var result = await _flutterTts.speak(currentText);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }
  }

  Future<void> _pause() async {
    var result = await _flutterTts.pause();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Texte - Style WhatsApp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Champ texte
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Saisis ton texte ici",
              ),
            ),
            SizedBox(height: 16),

            // Bouton "Générer l'audio"
            ElevatedButton(
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  setState(() {
                    currentText = _controller.text.trim();
                    isAudioReady = true;
                    isPlaying = false;
                  });
                }
              },
              child: Text("Générer l'audio"),
            ),

            SizedBox(height: 30),

            // Interface audio (sans texte)
            if (isAudioReady)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.graphic_eq, color: Colors.blue, size: 30),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        size: 36,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          _pause();
                        } else {
                          _speak();
                        }
                      },
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
