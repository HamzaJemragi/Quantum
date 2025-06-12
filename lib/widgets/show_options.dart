import 'package:flutter/material.dart';

import '../data/models/text_speech_model.dart';
import '../viewmodels/text_to_speechViewModel.dart';

import 'package:flutter/material.dart';

class AudioOptionsMenu extends StatelessWidget {
  final AudioViewModel viewModel;
  final int index;

  const AudioOptionsMenu({
    Key? key,
    required this.viewModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Télécharger'),
            onTap: () {
              Navigator.pop(context);
              viewModel.downloadAudio(index);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Supprimer'),
            onTap: () {
              Navigator.pop(context);
              viewModel.deleteAudio(index);
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Partager'),
            onTap: () {
              Navigator.pop(context);
              viewModel.shareAudio(index);
            },
          ),
        ],
      ),
    );
  }
}
