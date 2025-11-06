import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curriculum_vitae/screens/AboutScreen.dart';
import 'package:curriculum_vitae/screens/ContactScreen.dart';
import 'package:curriculum_vitae/screens/ExperienceScreen.dart';
import 'package:curriculum_vitae/screens/ProjectScreen.dart';
import 'package:curriculum_vitae/screens/ServiceScreen.dart';
import 'package:floating_navbar/floating_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      color: const Color(0xFF282828),
      selectedIconColor: const Color(0xFFE2FF8A),
      unselectedIconColor: Colors.grey,

      // backgroundColor: const Color(0xFF282828),
      // selectedBackgroundColor: const Color(0xFFE2FF8A).withOpacity(0.2),
      horizontalPadding: 20.0,
      showTitle: true,
      hapticFeedback: true,
      items: [
        FloatingNavBarItem(
          iconData: Icons.person,
          title: 'About',
          page: AboutPage(),
        ),
        FloatingNavBarItem(
          iconData: Icons.work,
          title: 'Experience',
          page: ExperiencePage(),
        ),
        FloatingNavBarItem(
          iconData: Icons.apps,
          title: 'Projects',
          page: ProjectsPage(),
        ),
        FloatingNavBarItem(
          iconData: Icons.build,
          title: 'Services',
          page: ServicesPage(),
        ),
        FloatingNavBarItem(
          iconData: Icons.contact_mail,
          title: 'Contact',
          page: ContactPage(),
        ),
      ],
    );
  }
}
