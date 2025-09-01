import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curriculum_vitae/screens/AboutScreen.dart';
import 'package:curriculum_vitae/screens/ContactScreen.dart';
import 'package:curriculum_vitae/screens/ExperienceScreen.dart';
import 'package:curriculum_vitae/screens/ProjectScreen.dart';
import 'package:curriculum_vitae/screens/ServiceScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    AboutPage(),
    ExperiencePage(),
    ProjectsPage(),
    ServicesPage(),
    ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: AppBar(
        backgroundColor: const Color(0xFF212121),
        elevation: 0,
        title: Text(
          'Mohamed Aouaq - Portfolio',
          style: GoogleFonts.michroma(
            textStyle: const TextStyle(
              letterSpacing: 1.2,
              fontSize: 18,
              color: Color(0xFFE2FF8A),
            ),
          ),
        ),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF151515), Color(0xFF212121)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF212121),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF282828),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/profile.jpg"), // Add your photo
                ),
                const SizedBox(height: 10),
                Text(
                  "Mohamed Aouaq",
                  style: GoogleFonts.michroma(
                    textStyle: const TextStyle(
                      color: Color(0xFFE2FF8A),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Software Developer | Mobile & Web",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          // Languages I Speak
          ListTile(
            leading: const Icon(Icons.language, color: Color(0xFFE6CC3B)),
            title: Text(
              "Languages I Speak",
              style: GoogleFonts.michroma(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              "Arabic, French, English",
              style: const TextStyle(color: Colors.grey),
            ),
          ),

          // Programming Skills
          ListTile(
            leading: const Icon(Icons.code, color: Color(0xFFE6CC3B)),
            title: Text(
              "Programming Languages",
              style: GoogleFonts.michroma(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              "Dart (Flutter), Java, Kotlin, Python, JavaScript, PHP",
              style: const TextStyle(color: Colors.grey),
            ),
          ),

          // Frameworks & Tools
          ListTile(
            leading: const Icon(Icons.build, color: Color(0xFFE6CC3B)),
            title: Text(
              "Frameworks & Tools",
              style: GoogleFonts.michroma(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              "Flutter, React Native, Android (Jetpack), Laravel, Firebase, MySQL, Git",
              style: const TextStyle(color: Colors.grey),
            ),
          ),

          const Divider(color: Colors.grey),

          // Socials
          ListTile(
            leading: const Icon(Icons.link, color: Color(0xFFE2FF8A)),
            title: const Text("LinkedIn"),
            onTap: () {
              // TODO: open LinkedIn link
            },
          ),
          ListTile(
            leading: const Icon(Icons.code_outlined, color: Color(0xFFE2FF8A)),
            title: const Text("GitHub"),
            onTap: () {
              // TODO: open GitHub link
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Color(0xFFE2FF8A)),
            title: const Text("Download CV"),
            onTap: () {
              // TODO: open resume link
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: const Color(0xFF282828),
        indicatorColor: const Color(0xFFE2FF8A).withOpacity(0.2),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return GoogleFonts.michroma(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFE2FF8A),
                ),
              );
            }
            return GoogleFonts.michroma(
              textStyle: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
      child: NavigationBar(
        height: 70,
        elevation: 8,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person), label: 'About'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Experience'),
          NavigationDestination(icon: Icon(Icons.apps), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.build), label: 'Services'),
          NavigationDestination(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
