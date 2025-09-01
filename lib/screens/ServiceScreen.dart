import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.phone_iphone, color: Color(0xFFE2FF8A)),
          title: Text('Mobile App Development'),
          subtitle: Text('Flutter, React Native, Android Native.'),
        ),
        ListTile(
          leading: Icon(Icons.web, color: Color(0xFFE2FF8A)),
          title: Text('Web Development'),
          subtitle: Text('Dashboards, APIs, admin panels.'),
        ),
        ListTile(
          leading: Icon(Icons.api, color: Color(0xFFE2FF8A)),
          title: Text('API Integration'),
          subtitle: Text(
            'Real-time data, authentication, Firebase integration.',
          ),
        ),
        ListTile(
          leading: Icon(Icons.support, color: Color(0xFFE2FF8A)),
          title: Text('Consulting / Technical Support'),
          subtitle: Text('Guidance for digital solutions and projects.'),
        ),
        ListTile(
          leading: Icon(Icons.monetization_on, color: Color(0xFFE2FF8A)),
          title: Text('Pricing'),
          subtitle: Text(
            'Available hourly or per project (contact for details).',
          ),
        ),
      ],
    );
  }
}
