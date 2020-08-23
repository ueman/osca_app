import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/authentication/auth_bloc.dart';
import 'package:hsos/overview/overview_scaffold.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (BuildContext context, state) => state.when(
        error: (_) => _LoginScaffold(),
        loading: () => _LoginScaffold(),
        loggedIn: () => const OverviewScaffold(),
        loggedOut: () => _LoginScaffold(),
      ),
      listener: (BuildContext context, AuthState state) {},
    );
  }
}

class _LoginScaffold extends StatefulWidget {
  @override
  __LoginScaffoldState createState() => __LoginScaffoldState();
}

class __LoginScaffoldState extends State<_LoginScaffold> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Lottie.asset('assets/lottie/school.json'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Logge dich mit deinen Osca-Login-Daten ein!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'Nutzername',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Passwort',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ButtonBar(
                buttonMinWidth: 100,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => _showInformation(context),
                    child: const Text('Hinweise'),
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        AuthEvent.login(
                          _userNameController.text,
                          _passwordController.text,
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showInformation(BuildContext context) {
    const repoUrl = 'https://github.com/ueman/osca_app';
    const title = 'Hinweise';
    const content = '''
Dies ist eine App von Studenten für Studenten.
Dies ist keine offizielle App von der Hochschule Osnabrück.
Die Benutzung dieser App erfolgt daher auf eigene Gefahr.
''';
    const accept = 'Verstanden';
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(title),
          content: const Text(content),
          actions: <Widget>[
            FlatButton(
              onPressed: () async {
                if (await canLaunch(repoUrl)) {
                  await launch(repoUrl);
                }
                Navigator.pop(context);
              },
              child: const Text('Source Code anschauen'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(accept),
            ),
          ],
        );
      },
    );
  }
}
