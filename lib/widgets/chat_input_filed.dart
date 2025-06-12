import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasText;
  final VoidCallback onSendPressed;
  final VoidCallback onMicPressed;
  final Color fillColor;
  final Color iconColor;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.hasText,
    required this.onSendPressed,
    required this.onMicPressed,
    required this.fillColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: Colors.grey.shade300, width: 1.2),
          borderRadius: BorderRadius.circular(25), // Coins arrondis
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Écrivez quelque chose...",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                hasText ? Icons.send : Icons.mic,
                color: iconColor,
              ),
              onPressed: hasText ? onSendPressed : onMicPressed,
            ),
          ],
        ),
      ),
    );
  }
}


