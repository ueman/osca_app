import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hsos/authentication/web_utils.dart';
import 'package:osca_dart/osca_dart.dart';

part 'course_detail_bloc.freezed.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc(this.course) : super(const CourseDetailState.loading()) {
    add(const CourseDetailEvent.reload());
  }

  final Course course;
  OscaWebApi api;

  @override
  Stream<CourseDetailState> mapEventToState(CourseDetailEvent event) async* {
    final cookie = await WebUtils.getFedAuthCookie();
    api = OscaWebApi(cookie);
    final files =
        await api.getListOfAllFilesForCourse(course.courseID.toString());
    final announcements =
        await api.getAllAnnouncementsForCourse(course.courseID.toString());
    yield CourseDetailState.loaded(files ?? [], announcements ?? []);
  }

  Future<Uint8List> downloadFile(CourseFile file) async {
    return api.loadFile(file);
  }
}

@freezed
abstract class CourseDetailEvent with _$CourseDetailEvent {
  const factory CourseDetailEvent.reload() = Reload;
}

@freezed
abstract class CourseDetailState with _$CourseDetailState {
  const factory CourseDetailState.error(String message) = Error;
  const factory CourseDetailState.loading() = Loading;
  const factory CourseDetailState.loaded(
    List<CourseFile> files,
    List<Announcement> announcements,
  ) = Loaded;
}
