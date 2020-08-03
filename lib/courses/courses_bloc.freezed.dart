// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'courses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CoursesEventTearOff {
  const _$CoursesEventTearOff();

// ignore: unused_element
  Reload reload() {
    return const Reload();
  }
}

// ignore: unused_element
const $CoursesEvent = _$CoursesEventTearOff();

mixin _$CoursesEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reload(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reload(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reload(Reload value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reload(Reload value),
    @required Result orElse(),
  });
}

abstract class $CoursesEventCopyWith<$Res> {
  factory $CoursesEventCopyWith(
          CoursesEvent value, $Res Function(CoursesEvent) then) =
      _$CoursesEventCopyWithImpl<$Res>;
}

class _$CoursesEventCopyWithImpl<$Res> implements $CoursesEventCopyWith<$Res> {
  _$CoursesEventCopyWithImpl(this._value, this._then);

  final CoursesEvent _value;
  // ignore: unused_field
  final $Res Function(CoursesEvent) _then;
}

abstract class $ReloadCopyWith<$Res> {
  factory $ReloadCopyWith(Reload value, $Res Function(Reload) then) =
      _$ReloadCopyWithImpl<$Res>;
}

class _$ReloadCopyWithImpl<$Res> extends _$CoursesEventCopyWithImpl<$Res>
    implements $ReloadCopyWith<$Res> {
  _$ReloadCopyWithImpl(Reload _value, $Res Function(Reload) _then)
      : super(_value, (v) => _then(v as Reload));

  @override
  Reload get _value => super._value as Reload;
}

class _$Reload with DiagnosticableTreeMixin implements Reload {
  const _$Reload();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoursesEvent.reload()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CoursesEvent.reload'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Reload);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result reload(),
  }) {
    assert(reload != null);
    return reload();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result reload(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (reload != null) {
      return reload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result reload(Reload value),
  }) {
    assert(reload != null);
    return reload(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result reload(Reload value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (reload != null) {
      return reload(this);
    }
    return orElse();
  }
}

abstract class Reload implements CoursesEvent {
  const factory Reload() = _$Reload;
}

class _$CoursesStateTearOff {
  const _$CoursesStateTearOff();

// ignore: unused_element
  Error error(String message) {
    return Error(
      message,
    );
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Loaded loaded(List<Course> courses) {
    return Loaded(
      courses,
    );
  }
}

// ignore: unused_element
const $CoursesState = _$CoursesStateTearOff();

mixin _$CoursesState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(String message),
    @required Result loading(),
    @required Result loaded(List<Course> courses),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(String message),
    Result loading(),
    Result loaded(List<Course> courses),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    @required Result orElse(),
  });
}

abstract class $CoursesStateCopyWith<$Res> {
  factory $CoursesStateCopyWith(
          CoursesState value, $Res Function(CoursesState) then) =
      _$CoursesStateCopyWithImpl<$Res>;
}

class _$CoursesStateCopyWithImpl<$Res> implements $CoursesStateCopyWith<$Res> {
  _$CoursesStateCopyWithImpl(this._value, this._then);

  final CoursesState _value;
  // ignore: unused_field
  final $Res Function(CoursesState) _then;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorCopyWithImpl<$Res> extends _$CoursesStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(Error(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$Error with DiagnosticableTreeMixin implements Error {
  const _$Error(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoursesState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoursesState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(String message),
    @required Result loading(),
    @required Result loaded(List<Course> courses),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(String message),
    Result loading(),
    Result loaded(List<Course> courses),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements CoursesState {
  const factory Error(String message) = _$Error;

  String get message;
  $ErrorCopyWith<Error> get copyWith;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$CoursesStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoursesState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CoursesState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(String message),
    @required Result loading(),
    @required Result loaded(List<Course> courses),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(String message),
    Result loading(),
    Result loaded(List<Course> courses),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CoursesState {
  const factory Loading() = _$Loading;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({List<Course> courses});
}

class _$LoadedCopyWithImpl<$Res> extends _$CoursesStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object courses = freezed,
  }) {
    return _then(Loaded(
      courses == freezed ? _value.courses : courses as List<Course>,
    ));
  }
}

class _$Loaded with DiagnosticableTreeMixin implements Loaded {
  const _$Loaded(this.courses) : assert(courses != null);

  @override
  final List<Course> courses;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoursesState.loaded(courses: $courses)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoursesState.loaded'))
      ..add(DiagnosticsProperty('courses', courses));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.courses, courses) ||
                const DeepCollectionEquality().equals(other.courses, courses)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(courses);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(String message),
    @required Result loading(),
    @required Result loaded(List<Course> courses),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loaded(courses);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(String message),
    Result loading(),
    Result loaded(List<Course> courses),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(courses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result loading(Loading value),
    @required Result loaded(Loaded value),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result loading(Loading value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements CoursesState {
  const factory Loaded(List<Course> courses) = _$Loaded;

  List<Course> get courses;
  $LoadedCopyWith<Loaded> get copyWith;
}
