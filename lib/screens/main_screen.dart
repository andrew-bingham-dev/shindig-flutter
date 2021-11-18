import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shindig/screens/contacts_screen.dart';
import 'package:shindig/screens/events_screen.dart';
import 'package:shindig/screens/home_screen.dart';
import 'package:shindig/screens/profile_screen.dart';
import 'package:shindig/screens/settings_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shindig'),
          bottom: const TabBar(
            tabs: [
              TabIcon(icon: Icons.home_outlined),
              TabIcon(icon: Icons.person_outlined),
              TabIcon(icon: Icons.people_outline),
              TabIcon(icon: Icons.event_outlined),
              TabIcon(icon: Icons.settings_outlined),
            ],
          ),
        ),
        body: const TabBarView(children: [
          HomeScreen(),
          ProfileScreen(),
          ContactsScreen(),
          EventsScreen(),
          SettingsScreen()
        ]),
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
        size: 30,
      ),
    );
  }
}
