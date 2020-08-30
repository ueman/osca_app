import 'package:flutter/material.dart';
import 'package:hsos/appointments/appointments_page.dart';
import 'package:hsos/courses/courses_page.dart';
import 'package:hsos/exams/exams_page.dart';
import 'package:hsos/exams/stats/stats_page.dart';
import 'package:hsos/settings/settings_scaffold.dart';

class OverviewScaffold extends StatelessWidget {
  const OverviewScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyHSOS'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
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
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(
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
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(
                '📊', // or maybe 📈
                style: TextStyle(fontSize: 25),
              ),
            ),
            title: const Text('Noten-Statistiken'),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const StatsPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.black26,
              child: Text(
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
            leading: const CircleAvatar(
              backgroundColor: Colors.black26,
              child: Text(
                '📚',
                style: TextStyle(fontSize: 25),
              ),
            ),
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
