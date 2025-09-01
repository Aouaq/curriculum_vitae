import 'package:curriculum_vitae/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:curriculum_vitae/screens/SplashScreen.dart';
import 'package:curriculum_vitae/utils/Theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  Offset mousePosition = Offset.zero;
  double width = 50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamed Aouaq - Portfolio',
      theme: AppTheme.customTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Stack(
          children: [
            // Track the mouse position over the whole page
            MouseRegion(
              onHover: (event) {
                setState(() {
                  mousePosition = event.position;
                  width= 30;
                });
              },
              cursor: SystemMouseCursors.none,
              child: child, // This is your SplashScreen / other pages
            ),

            // Custom cursor that does NOT block gestures
            Positioned(
              left: mousePosition.dx - 15,
              top: mousePosition.dy - 15,
              child: IgnorePointer(
                ignoring: true, // allow clicks to pass through
                child: _buildFuturisticCursor(),
              ),
            ),
          ],
        );
      },
      home: const SplashScreen(),
    );
    
  }

  Widget _buildFuturisticCursor() {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: Center(
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
