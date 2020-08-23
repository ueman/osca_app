import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/appointments/appointments_bloc.dart';
import 'package:hsos/widgets/error_scaffold.dart';
import 'package:hsos/widgets/loading_scaffold.dart';
import 'package:osca_dart/app/models/appointment.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:provider/provider.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppointmentsBloc(context.read<OscaAppApi>()),
      child: BlocBuilder<AppointmentsBloc, AppointmentsState>(
        builder: (context, state) => state.when(
          error: (message) => ErrorScaffold(
            title: 'Stundenplan',
            errorMessage: message,
          ),
          loading: () => const LoadingScaffold(
            title: 'Stundenplan',
          ),
          loaded: (appointments) => _AppointmentsListScaffold(
            appointments: appointments,
          ),
        ),
      ),
    );
  }
}

class _AppointmentsListScaffold extends StatelessWidget {
  const _AppointmentsListScaffold({Key key, this.appointments})
      : super(key: key);
  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stundenplan')),
      body: ListView(
        children: appointments.map((e) {
          return ListTile(
            title: Text(e.appointmentName),
            subtitle: Text('${e.timetableDate}\n${e.roomString}'),
          );
        }).toList(growable: false),
      ),
    );
  }
}
