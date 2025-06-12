import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: QuantumColors.whiteColor,
      title: Text(
        'Quantum',
        style: TextStyle(
          color: QuantumColors.bleuPourpre,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      shadowColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("  click this ")),
              );
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://pics.craiyon.com/2023-07-15/dc2ec5a571974417a5551420a4fb0587.webp'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

