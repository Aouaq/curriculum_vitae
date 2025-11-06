import 'package:curriculum_vitae/screens/hexagonAvatar.dart';
import 'package:curriculum_vitae/screens/typewriter_cycle.dart';
import 'package:curriculum_vitae/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _heroController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, dynamic>> skills = [
    {'name': 'Sites web statiques', 'icon': Icons.web},
    {'name': 'Bases de données SQL', 'icon': Icons.storage},
    {'name': 'Sites web dynamiques', 'icon': Icons.language},
    {'name': 'XML / KOTLIN', 'icon': Icons.code},
    {'name': 'KOTLIN', 'icon': Icons.developer_mode},
    {'name': 'PYTHON', 'icon': Icons.memory},
    {'name': 'Jetpack Compose', 'icon': Icons.android},
    {'name': 'React-Native / Flutter', 'icon': Icons.phone_iphone},
  ];

  final List<Map<String, dynamic>> education = [
    {
      'school': 'La Rochelle University',
      'degree': 'Bachelor of Computer Science',
      'period': '2025 - Present',
      'description':
          'Focused on software development, mobile & web technologies, and AI projects.',
      'icon': Icons.school,
    },
    {
      'school': 'ISTA NTIC Marrakech',
      'degree': 'Diploma in IT Development (Bac+2)',
      'period': '2023 - 2025',
      'description':
          'Specialized in mobile app development, React Native, and Android apps.',
      'icon': Icons.computer,
    },
  ];

  @override
  void initState() {
    super.initState();

    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _heroController, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _heroController, curve: Curves.easeOut));

    _heroController.forward();
  }

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _buildHeroSection(screenHeight),
          _buildAboutSection(screenHeight),
          _buildSkillTimeline(screenHeight),
          _buildEducationSection(screenHeight),
        ],
      ),
    );
  }

  Widget _buildHeroSection(double height) {
    return Container(
      height: height,
      color: AppColors.surface,
      child: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Mohamed Aouaq',
                      style: GoogleFonts.michroma(
                        fontSize: 36,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TypewriterCycle(
                      texts: ['Mobile Developer', 'Web Developer', 'Freelancer'],
                      textStyle: GoogleFonts.roboto(
                        fontSize: 20,
                        color: AppColors.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                HoverRotatingDoubleHexagon(
                  size: 150,
                  innerColor: AppColors.secondary,
                  outerColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection(double height) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: AppColors.surfaceVariant,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: GoogleFonts.michroma(fontSize: 28, color: AppColors.secondary),
              ),
              const SizedBox(height: 16),
              Text(
                "I build cross-platform mobile and web apps. Clean, maintainable code with a focus on user experience.",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: AppColors.onSurface.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildSkillTimeline(double height) {
  return Container(
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
    color: AppColors.surface,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skill Roadmap',
          style: GoogleFonts.michroma(
            fontSize: 28,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: skills.length,
            separatorBuilder: (_, __) => const SizedBox(height: 40),
            itemBuilder: (context, index) {
              final skill = skills[index];

              return TweenAnimationBuilder<Offset>(
                tween: Tween<Offset>(
                  begin: const Offset(-0.3, 0),
                  end: Offset.zero,
                ),
                duration: Duration(milliseconds: 600 + index * 150),
                curve: Curves.easeOut,
                builder: (context, offset, child) {
                  return Transform.translate(
                    offset: Offset(offset.dx * 300, 0),
                    child: Opacity(
                      opacity: 1 - offset.dx.abs() * 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Timeline point
                          Column(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  skill['icon'],
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                              if (index != skills.length - 1)
                                Container(
                                  width: 4,
                                  height: 60,
                                  color: AppColors.primary.withOpacity(0.3),
                                ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          // Skill card
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceVariant,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.1),
                                    blurRadius: 12,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                skill['name'],
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

  Widget _buildEducationSection(double height) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: AppColors.surfaceVariant,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Education',
                style: GoogleFonts.michroma(fontSize: 28, color: AppColors.secondary),
              ),
              const SizedBox(height: 20),
              ...education.map((edu) => _buildEducationCard(edu)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationCard(Map<String, dynamic> edu) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isHovered ? AppColors.surface : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.6),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(edu['icon'], color: AppColors.primary, size: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(edu['school'],
                          style: GoogleFonts.michroma(
                              fontSize: 18, color: AppColors.primary)),
                      const SizedBox(height: 4),
                      Text('${edu['degree']} • ${edu['period']}',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: AppColors.onSurface.withOpacity(0.7))),
                      const SizedBox(height: 8),
                      Text(edu['description'],
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: AppColors.onSurface.withOpacity(0.6))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
