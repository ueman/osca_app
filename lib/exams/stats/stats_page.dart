import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/db/database.dart';
import 'package:hsos/exams/stats/statistics.dart';
import 'package:hsos/exams/stats/stats_bloc.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StatsBloc(
        context.read<OscaAppApi>(),
        context.read<AppDatabase>(),
      ),
      child: BlocBuilder<StatsBloc, StatsState>(
        builder: (context, state) => state.when(
          error: (message) => Scaffold(
            body: Center(
              child: Text(message),
            ),
          ),
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (stats) => _StatsListScaffold(
            stats: stats,
          ),
        ),
      ),
    );
  }
}

class _StatsListScaffold extends StatelessWidget {
  const _StatsListScaffold({Key key, this.stats}) : super(key: key);
  final Statistics stats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistiken')),
      body: ListView(
        children: [
          if (stats.averageBachelorGrade != null)
            Text('Bachelor Durchschnittsnote: ${stats.averageBachelorGrade}'),
          if (stats.averageMasterGrade != null)
            Text('Master Durchschnittsnote: ${stats.averageMasterGrade}'),
          if (stats.averageBachelorGrade != null)
            Text('Durchschnittsnote: ${stats.averageGrade}'),
        ],
      ),
    );
  }
}
