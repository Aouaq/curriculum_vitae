import 'package:curriculum_vitae/screens/HomeScreen.dart';
import 'package:curriculum_vitae/screens/MatrixRain.dart';
import 'package:curriculum_vitae/screens/TypewriterCycle.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    // Scale animation setup
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scale = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeOut));

    _scaleController.forward();

    // Navigate to HomeScreen after 5 seconds
    Future.delayed(const Duration(seconds: 20), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF151515),
    body: Stack(
      fit: StackFit.expand,
      children: [
        const MatrixRain(columnCount: 25, color: Color(0xFFE2FF8A)), // 👈 Matrix effect
       Center(
  child: ScaleTransition(
    scale: _scale,
    child: TypewriterCycle(
      texts: ["welcome", "bonjour", "hola", "hallo"],
      textStyle: const TextStyle(
        fontSize: 32.0,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE2FF8A),
        fontFamily: 'Michroma',
      ),
    ),
  ),
)
],
    ),
  );
}
}
