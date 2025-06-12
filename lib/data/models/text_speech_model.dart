// class TextToSpeechModel {
//   String text;
//   String language;
//   bool isPlaying;
//
//   TextToSpeechModel({
//     this.text = '',
//     this.language = 'fr-FR',
//     this.isPlaying = false,
//   });
// }
class AudioMessage {
  final String text;
  final String languageCode;
  final String? audioFilePath; // chemin local vers le fichier audio

  AudioMessage({
    required this.text,
    required this.languageCode,
    this.audioFilePath,
  });
}

