// widgets/audio_message_widget.dart

import 'package:flutter/material.dart';
import '../data/models/text_speech_model.dart'; // Assure-toi que ce chemin est correct

class AudioMessageWidget extends StatelessWidget {
  final AudioMessage message;
  final bool isPlaying;
  final VoidCallback onPlayPause;

  const AudioMessageWidget({
    super.key,
    required this.message,
    required this.isPlaying,
    required this.onPlayPause,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texte du message
            Text(
              message.text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            // Langue et bouton audio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message.languageCode,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: Colors.blue,
                    size: 32,
                  ),
                  onPressed: onPlayPause,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
