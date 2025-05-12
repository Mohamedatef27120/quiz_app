import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, 0),
          radius: 1.2,
          colors: [
            Color(0xFF4A1D7A),
            Color(0xFF1A1F37),
          ],
          stops: [0.0, 0.7],
        ),
      ),
      child: child,
    );
  }
}
