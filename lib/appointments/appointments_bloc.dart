import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:osca_dart/osca_dart.dart';

part 'appointments_bloc.freezed.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc(this.api) : super(const AppointmentsState.loading()) {
    add(const AppointmentsEvent.reload());
  }
  final OscaAppApi api;

  @override
  Stream<AppointmentsState> mapEventToState(AppointmentsEvent event) async* {
    final appointments = await api.getAppointments();
    appointments.sort((a, b) => b.timetableDate.compareTo(a.timetableDate));
    yield AppointmentsState.loaded(appointments);
  }
}

@freezed
abstract class AppointmentsEvent with _$AppointmentsEvent {
  const factory AppointmentsEvent.reload() = Reload;
}

@freezed
abstract class AppointmentsState with _$AppointmentsState {
  const factory AppointmentsState.error(String message) = Error;
  const factory AppointmentsState.loading() = Loading;
  const factory AppointmentsState.loaded(List<Appointment> exams) = Loaded;
}
