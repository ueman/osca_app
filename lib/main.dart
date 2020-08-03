import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/authentication/auth_bloc.dart';
import 'package:hsos/authentication/login_page.dart';
import 'package:hsos/db/database.dart';
import 'package:hsos/theme/theme.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.db}) : super(key: key);

  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<OscaAppApi>(
          create: (_) => OscaAppApi(),
        ),
        Provider<AppDatabase>(
          create: (_) => db,
        ),
      ],
      child: BlocProvider<AuthBloc>(
        create: (BuildContext context) {
          return AuthBloc(context.read<OscaAppApi>());
        },
        child: MaterialApp(
          title: 'Osca',
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const LoginPage(),
        ),
      ),
    );
  }
}
