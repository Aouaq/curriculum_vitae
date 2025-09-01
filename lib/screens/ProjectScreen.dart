import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          color: Color(0xFF282828),
          child: ListTile(
            title: Text('Energy Monitoring App'),
            subtitle: Text(
              'React Native + Firebase + EmonCMS API\nReal-time and historical energy usage monitoring with charts.',
            ),
          ),
        ),
        Card(
          color: Color(0xFF282828),
          child: ListTile(
            title: Text('Android Retrofit Project'),
            subtitle: Text('Displays comments from an API using RecyclerView.'),
          ),
        ),
        Card(
          color: Color(0xFF282828),
          child: ListTile(
            title: Text('Favorites System in Multi-Fragment App'),
            subtitle: Text(
              'Allows users to save products as favorites and view them in another fragment.',
            ),
          ),
        ),
      ],
    );
  }
}
