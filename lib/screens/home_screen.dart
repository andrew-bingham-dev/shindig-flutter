import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shindig'),
      ),
      body: const DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: TabBar(
          tabs: [
            TabIcon(icon: Icons.home_outlined),
            TabIcon(icon: Icons.person_outlined),
            TabIcon(icon: Icons.people_outline),
            TabIcon(icon: Icons.event_outlined),
            TabIcon(icon: Icons.settings_outlined),
          ],
        ),
      ),
    );
  }
}

class TabIcon extends StatelessWidget {
  final IconData icon;
  const TabIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        icon,
        size: 45,
      ),
    );
  }
}
