import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/authentication/auth_bloc.dart';
import 'package:hsos/settings/cookie_scaffold.dart';

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Dateibereich freischalten'),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const CookieScaffold();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Logout'),
            onTap: () {
              BlocProvider.of<AuthBloc>(context).logout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
