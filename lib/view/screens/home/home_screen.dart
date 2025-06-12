import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quantum/core/constants/colors.dart';

import '../../../viewmodels/text_to_speechViewModel.dart';
import '../../../widgets/animated_waves.dart';
import '../../../widgets/appbar_widget.dart';

import 'package:flutter/material.dart';

import '../../../widgets/chat_input_filed.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/show_options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  void _onSendPressed(AudioViewModel viewModel) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final locale = Localizations.localeOf(context);
    final langCode = locale.toLanguageTag(); // ex: fr-FR

    viewModel.addAudioMessage(text, langCode);
    _controller.clear();
  }

  void _onMicPressed() {
    Navigator.of(context).pushReplacementNamed('/voice');
    // Reconnaissance vocale possible ici
  }

  void _showAudioOptions(BuildContext context, AudioViewModel viewModel, int index) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AudioOptionsMenu(viewModel: viewModel, index: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: Container(
        color: QuantumColors.whiteColor,
        child: Consumer<AudioViewModel>(
          builder: (context, viewModel, child) {
            final screenWidth = MediaQuery.of(context).size.width;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: viewModel.audioMessages.length,
                    itemBuilder: (context, index) {
                      final msg = viewModel.audioMessages[index];
                      final isPlaying = viewModel.playingIndex == index && viewModel.isPlaying;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Message texte aligné à droite
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 300),
                                child: Card(
                                  color: Colors.grey[100],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      msg.text,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Carte audio avec détection du long press
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.75,
                                child: GestureDetector(
                                  onLongPress: () => _showAudioOptions(context, viewModel, index),
                                  child: Card(
                                    color: QuantumColors.whiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              isPlaying
                                                  ? Icons.pause_circle_filled
                                                  : Icons.play_circle_fill,
                                              size: 32,
                                              color: QuantumColors.bleuPourpre,
                                            ),
                                            onPressed: () => viewModel.playAudio(index),
                                          ),
                                          const SizedBox(width: 8),
                                          AnimatedWaves(
                                            isPlaying: isPlaying,
                                            width: 150,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: ChatInputField(
                    controller: _controller,
                    hasText: _hasText,
                    onSendPressed: () => _onSendPressed(viewModel),
                    onMicPressed: _onMicPressed,
                    fillColor: QuantumColors.colorEditText,
                    iconColor: QuantumColors.bleuPourpre,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
