import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          // Hero Section
          Container(
            height: screenHeight,
            color: const Color(0xFF212121),
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/12345678?v=4'), // Replace with your image
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Mohamed Aouaq',
                        style: GoogleFonts.michroma(
                            fontSize: 36, color: const Color(0xFFE2FF8A)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Mobile & Web Developer • Freelance',
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // About Section
          Container(
            height: screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: const Color(0xFF1A1A1A),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About Me',
                        style: GoogleFonts.michroma(
                            fontSize: 28, color: theme.colorScheme.primary)),
                    const SizedBox(height: 16),
                    Text(
                      "I build cross-platform mobile and web apps. Clean, maintainable code with a focus on user experience.",
                      style: GoogleFonts.roboto(
                          fontSize: 16, color: Colors.white70, height: 1.4),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Skills Section
          Container(
            height: screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: const Color(0xFF1E1E1E),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Skills & Tools',
                        style: GoogleFonts.michroma(
                            fontSize: 28, color: theme.colorScheme.secondary)),
                    const SizedBox(height: 16),
                    _buildSkillRow('Dart', Icons.code, 0.9),
                    _buildSkillRow('Flutter', Icons.phone_iphone, 0.85),
                    _buildSkillRow('React Native', Icons.developer_mode, 0.8),
                    _buildSkillRow('Firebase', Icons.cloud, 0.75),
                    _buildSkillRow('Git', Icons.merge_type, 0.8),
                  ],
                ),
              ),
            ),
          ),

          // Education Section
          Container(
            height: screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: const Color(0xFF282828),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Education',
                        style: GoogleFonts.michroma(
                            fontSize: 28, color: const Color(0xFFE6CC3B))),
                    const SizedBox(height: 20),
                    _buildEducationCard(
                        'La Rochelle University',
                        'Bachelor of Computer Science',
                        '2025 - Present',
                        'Focused on software development, mobile & web technologies, and AI projects.',
                        Icons.school),
                    const SizedBox(height: 12),
                    _buildEducationCard(
                        'ISTA NTIC Marrakech',
                        'Diploma in IT Development (Bac+2)',
                        '2023 - 2025',
                        'Specialized in mobile app development, React Native, and Android apps.',
                        Icons.computer),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillRow(String skill, IconData icon, double level) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFE6CC3B)),
            const SizedBox(width: 10),
            SizedBox(
                width: 100, child: Text(skill, style: const TextStyle(color: Colors.white))),
            const SizedBox(width: 12),
            Expanded(
              child: LinearProgressIndicator(
                value: level,
                backgroundColor: Colors.white12,
                color: const Color(0xFFE2FF8A),
                minHeight: 8,
              ),
            ),
          ],
        ),
      );

  Widget _buildEducationCard(
          String school, String degree, String period, String description, IconData icon) =>
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF383838),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFFE2FF8A), size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(school,
                      style: GoogleFonts.michroma(
                          fontSize: 18, color: const Color(0xFFE2FF8A))),
                  const SizedBox(height: 4),
                  Text('$degree • $period',
                      style: GoogleFonts.roboto(fontSize: 14, color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text(description,
                      style: GoogleFonts.roboto(fontSize: 14, color: Colors.white60)),
                ],
              ),
            ),
          ],
        ),
      );
}
