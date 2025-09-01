import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          title: Text('ISTA NTIC Marrakech'),
          subtitle: Text('IT Development Student (Bac+2) - 2023–Present'),
        ),
        ListTile(
          title: Text('Cadi Ayyad University'),
          subtitle: Text('Physical & Chemical Sciences - 2022–2023'),
        ),
      ],
    );
  }
}
