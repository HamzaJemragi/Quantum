import 'package:flutter/material.dart';
import 'dart:math' as math;

class VoiceChatScreen extends StatefulWidget {
  @override
  _VoiceChatScreenState createState() => _VoiceChatScreenState();
}

class _VoiceChatScreenState extends State<VoiceChatScreen>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _waveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.decelerate),
    );
    _waveController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: _waveAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(200, 300),
                    painter: WaveformPainter(_waveAnimation.value),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF8B5CF6).withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle microphone tap
                  },
                  child: Icon(Icons.phone, color: Colors.white, size: 32),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final double animationValue;

  WaveformPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Color(0xFF8B5CF6)
          ..strokeWidth = 3.0
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    // Define wave heights for different bars
    final waveHeights = [
      10,
      30,
      60,
      90,
      120,
      150,
      180,
      210,
      240,
      270,
      270,
      240,
      210,
      180,
      150,
      120,
      90,
      60,
      30,
      10
    ];

    final barWidth = 7.0;
    final barSpacing = 8.0;
    final totalWidth =
        (waveHeights.length * barWidth) +
        ((waveHeights.length - 1) * barSpacing);
    final startX = center.dx - (totalWidth / 2);

    for (int i = 0; i < waveHeights.length; i++) {
      final x = startX + (i * (barWidth + barSpacing));

      // Add animation effect to make waves dynamic
      final animatedHeight =
          waveHeights[i] *
          (0.3 +
              0.7 *
                  (math.sin(animationValue * math.pi * 2 + i * 0.3) * 0.5 +
                      0.5));

      final startY = center.dy - (animatedHeight / 2);
      final endY = center.dy + (animatedHeight / 2);

      // Create rounded rectangle path for each bar
      final rect = RRect.fromLTRBR(
        x,
        startY,
        x + barWidth,
        endY,
        Radius.circular(barWidth / 2),
      );

      canvas.drawRRect(rect, paint..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}