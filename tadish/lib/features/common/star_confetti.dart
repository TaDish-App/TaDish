import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class StarConfetti extends StatefulWidget {
  const StarConfetti({super.key});

  @override
  StarConfettiState createState() {
    return StarConfettiState();
  }
}

class StarConfettiState extends State<StarConfetti> {
  late final _controllerCenter = ConfettiController(
      duration: const Duration(seconds: 1));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controllerCenter.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerCenter.stop();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: _controllerCenter,
        blastDirectionality:
        BlastDirectionality.explosive,
        // don't specify a direction, blast randomly
        shouldLoop: true,
        // start again as soon as the animation is finished
        colors: [
          Colors.green.withAlpha(90),
          Colors.blue.withAlpha(90),
          Colors.pink.withAlpha(90),
          Colors.orange.withAlpha(90),
          Colors.purple.withAlpha(90)
        ],
        // manually specify the colors to be used
        createParticlePath:
        drawStar, // define a custom shape/path.
      ),
    );
  }
}