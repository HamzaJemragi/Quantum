import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:quantum/view/screens/voice_chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio WhatsApp Style',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VoiceChatScreen(),
    );
  }
}

// class AudioPage extends StatefulWidget {
//   @override
//   State<AudioPage> createState() => _AudioPageState();
// }

// class _AudioPageState extends State<AudioPage> {
//   final TextEditingController _controller = TextEditingController();
//   final FlutterTts _flutterTts = FlutterTts();

//   String currentText = "";
//   bool isAudioReady = false;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();

//     _flutterTts.setCompletionHandler(() {
//       setState(() {
//         isPlaying = false;
//       });
//     });

//     _flutterTts.setCancelHandler(() {
//       setState(() {
//         isPlaying = false;
//       });
//     });

//     _flutterTts.setPauseHandler(() {
//       setState(() {
//         isPlaying = false;
//       });
//     });
//   }

//   Future<void> _speak() async {
//     if (currentText.isNotEmpty) {
//       await _flutterTts.setLanguage("fr-FR");
//       await _flutterTts.setSpeechRate(0.5);
//       var result = await _flutterTts.speak(currentText);
//       if (result == 1) {
//         setState(() {
//           isPlaying = true;
//         });
//       }
//     }
//   }

//   Future<void> _pause() async {
//     var result = await _flutterTts.pause();
//     if (result == 1) {
//       setState(() {
//         isPlaying = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _flutterTts.stop();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Audio Texte - Style WhatsApp"),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Center(
//           child: Column(
//             // Column is also a layout widget. It takes a list of children and
//             // arranges them vertically. By default, it sizes itself to fit its
//             // children horizontally, and tries to be as tall as its parent.
//             //
//             // Column has various properties to control how it sizes itself and
//             // how it positions its children. Here we use mainAxisAlignment to
//             // center the children vertically; the main axis here is the vertical
//             // axis because Columns are vertical (the cross axis would be
//             // horizontal).
//             //
//             // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//             // action in the IDE, or press "p" in the console), to see the
//             // wireframe for each widget.
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text('You have pushed the button this many times:'),
//               // Text(
//               //   '$_counter',
//               //   style: Theme.of(context).textTheme.headlineMedium,
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }