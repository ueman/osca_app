import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/db/database.dart';
import 'package:hsos/exams/exams_bloc.dart';
import 'package:hsos/widgets/error_scaffold.dart';
import 'package:hsos/widgets/loading_scaffold.dart';
import 'package:osca_dart/app/models/exam.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:provider/provider.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ExamsBloc(
        context.read<OscaAppApi>(),
        context.read<AppDatabase>(),
      ),
      child: BlocBuilder<ExamsBloc, ExamsState>(
        builder: (context, state) => state.when(
          error: (message) => ErrorScaffold(
            title: 'Noten',
            errorMessage: message,
          ),
          loading: () => const LoadingScaffold(
            title: 'Noten',
          ),
          loaded: (exams) => _ExamsListScaffold(
            exams: exams,
          ),
        ),
      ),
    );
  }
}

class _ExamsListScaffold extends StatelessWidget {
  const _ExamsListScaffold({Key key, this.exams}) : super(key: key);
  final List<Exam> exams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noten')),
      body: ListView(
        children: exams.map((e) {
          return ListTile(
            title: Text(e.context),
            subtitle: Text(e.examName),
          );
        }).toList(growable: false),
      ),
    );
  }
}
