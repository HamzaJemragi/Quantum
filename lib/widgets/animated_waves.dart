import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quantum/core/constants/colors.dart';

class AnimatedWaves extends StatefulWidget {
  final bool isPlaying;
  final double width;

  const AnimatedWaves({
    super.key,
    required this.isPlaying,
    required this.width,
  });

  @override
  State<AnimatedWaves> createState() => _AnimatedWavesState();
}

class _AnimatedWavesState extends State<AnimatedWaves> {
  late List<double> _waveHeights;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _waveHeights = List.filled(10, 15.0); // hauteur initiale
    _setupTimer();
  }

  @override
  void didUpdateWidget(covariant AnimatedWaves oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlaying != widget.isPlaying) {
      _setupTimer();
    }
  }

  void _setupTimer() {
    _timer?.cancel();
    if (widget.isPlaying) {
      _timer = Timer.periodic(const Duration(milliseconds: 180), (_) {
        setState(() {
          final random = Random();
          for (int i = 0; i < _waveHeights.length; i++) {
            _waveHeights[i] = 10.0 + random.nextInt(25);
          }
        });
      });
    } else {
      setState(() {
        _waveHeights = List.filled(10, 15.0); // hauteur fixe
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget buildWaveBar(double height) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: (widget.width - 60) / _waveHeights.length, // largeur adaptative
      height: height,
      decoration: BoxDecoration(
        color: QuantumColors.bleuPourpre,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _waveHeights.map(buildWaveBar).toList(),
      ),
    );
  }
}
