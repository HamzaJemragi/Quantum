import 'package:flutter/material.dart';

import '../data/models/text_speech_model.dart';

import 'package:flutter/material.dart';

import '../viewmodels/text_to_speechViewModel.dart';

import '../widgets/drawer_widget.dart';
import '../data/models/text_speech_model.dart';
import 'appbar_widget.dart';
import 'chat_input_filed.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _controller = TextEditingController();
//   bool _hasText = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       setState(() {
//         _hasText = _controller.text.isNotEmpty;
//       });
//     });
//   }
//
//   void _onSendPressed(AudioViewModel viewModel) {
//     final text = _controller.text.trim();
//     if (text.isEmpty) return;
//
//     final locale = Localizations.localeOf(context);
//     final langCode = locale.toLanguageTag(); // Exemple : 'fr-FR'
//
//     viewModel.addAudioMessage(text, langCode);
//     _controller.clear();
//   }
//
//   void _onMicPressed() {
//     print("Microphone pressed");
//     // Tu peux ajouter ici la reconnaissance vocale si nécessaire
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => AudioViewModel(),
//       child: Scaffold(
//         appBar: AppBarWidget(),
//         drawer: DrawerWidget(),
//         body: Consumer<AudioViewModel>(
//           builder: (context, viewModel, child) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(12),
//                     itemCount: viewModel.audioMessages.length,
//                     itemBuilder: (context, index) {
//                       final msg = viewModel.audioMessages[index];
//                       final isPlaying = viewModel.playingIndex == index && viewModel.isPlaying;
//
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 12.0),
//                         child: Card(
//                           color: Colors.grey[200],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   msg.text,
//                                   style: const TextStyle(fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     IconButton(
//                                       icon: Icon(
//                                         isPlaying
//                                             ? Icons.pause_circle_filled
//                                             : Icons.play_circle_fill,
//                                         size: 32,
//                                         color: Colors.blue.shade900,
//                                       ),
//                                       onPressed: () => viewModel.playAudio(index),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Text(
//                                       msg.languageCode,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 ChatInputField(
//                   controller: _controller,
//                   hasText: _hasText,
//                   onSendPressed: () => _onSendPressed(viewModel),
//                   onMicPressed: _onMicPressed,
//                   fillColor: Colors.grey[200]!,
//                   iconColor: Colors.blue.shade900,
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
