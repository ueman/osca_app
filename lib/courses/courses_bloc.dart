import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:osca_dart/osca_dart.dart';

part 'courses_bloc.freezed.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc(this.api) : super(const CoursesState.loading()) {
    add(const CoursesEvent.reload());
  }
  final OscaAppApi api;

  @override
  Stream<CoursesState> mapEventToState(CoursesEvent event) async* {
    final courses = await api.getCoursesSortedByCourseDesc();
    yield CoursesState.loaded(courses);
  }
}

@freezed
abstract class CoursesEvent with _$CoursesEvent {
  const factory CoursesEvent.reload() = Reload;
}

@freezed
abstract class CoursesState with _$CoursesState {
  const factory CoursesState.error(String message) = Error;
  const factory CoursesState.loading() = Loading;
  const factory CoursesState.loaded(List<Course> courses) = Loaded;
}
