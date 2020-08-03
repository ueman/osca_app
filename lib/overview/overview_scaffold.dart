import 'package:flutter/material.dart';
import 'package:hsos/appointments/appointments_page.dart';
import 'package:hsos/courses/courses_page.dart';
import 'package:hsos/exams/exams_page.dart';
import 'package:hsos/settings/settings_scaffold.dart';

class OverviewScaffold extends StatelessWidget {
  const OverviewScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyOsca'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SettingsScaffold();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: const Text(
                '🎓',
                style: TextStyle(fontSize: 25),
              ),
            ),
            title: const Text('Noten'),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ExamsPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black26,
              child: const Text(
                '🗓',
                style: TextStyle(fontSize: 25),
              ),
            ),
            title: const Text('Stundenplan'),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AppointmentsPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Kurse'),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const CoursesPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
