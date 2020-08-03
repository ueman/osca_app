// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'course_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CourseDetailEventTearOff {
  const _$CourseDetailEventTearOff();

// ignore: unused_element
  Reload reload() {
    return const Reload();
  }
}

// ignore: unused_element
const $CourseDetailEvent = _$CourseDetailEventTearOff();

mixin _$CourseDetailEvent {
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

abstract class $CourseDetailEventCopyWith<$Res> {
  factory $CourseDetailEventCopyWith(
          CourseDetailEvent value, $Res Function(CourseDetailEvent) then) =
      _$CourseDetailEventCopyWithImpl<$Res>;
}

class _$CourseDetailEventCopyWithImpl<$Res>
    implements $CourseDetailEventCopyWith<$Res> {
  _$CourseDetailEventCopyWithImpl(this._value, this._then);

  final CourseDetailEvent _value;
  // ignore: unused_field
  final $Res Function(CourseDetailEvent) _then;
}

abstract class $ReloadCopyWith<$Res> {
  factory $ReloadCopyWith(Reload value, $Res Function(Reload) then) =
      _$ReloadCopyWithImpl<$Res>;
}

class _$ReloadCopyWithImpl<$Res> extends _$CourseDetailEventCopyWithImpl<$Res>
    implements $ReloadCopyWith<$Res> {
  _$ReloadCopyWithImpl(Reload _value, $Res Function(Reload) _then)
      : super(_value, (v) => _then(v as Reload));

  @override
  Reload get _value => super._value as Reload;
}

class _$Reload implements Reload {
  const _$Reload();

  @override
  String toString() {
    return 'CourseDetailEvent.reload()';
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

abstract class Reload implements CourseDetailEvent {
  const factory Reload() = _$Reload;
}

class _$CourseDetailStateTearOff {
  const _$CourseDetailStateTearOff();

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
  Loaded loaded(List<CourseFile> files, List<Announcement> announcements) {
    return Loaded(
      files,
      announcements,
    );
  }
}

// ignore: unused_element
const $CourseDetailState = _$CourseDetailStateTearOff();

mixin _$CourseDetailState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(String message),
    @required Result loading(),
    @required
        Result loaded(List<CourseFile> files, List<Announcement> announcements),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(String message),
    Result loading(),
    Result loaded(List<CourseFile> files, List<Announcement> announcements),
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

abstract class $CourseDetailStateCopyWith<$Res> {
  factory $CourseDetailStateCopyWith(
          CourseDetailState value, $Res Function(CourseDetailState) then) =
      _$CourseDetailStateCopyWithImpl<$Res>;
}

class _$CourseDetailStateCopyWithImpl<$Res>
    implements $CourseDetailStateCopyWith<$Res> {
  _$CourseDetailStateCopyWithImpl(this._value, this._then);

  final CourseDetailState _value;
  // ignore: unused_field
  final $Res Function(CourseDetailState) _then;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorCopyWithImpl<$Res> extends _$CourseDetailStateCopyWithImpl<$Res>
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

class _$Error implements Error {
  const _$Error(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'CourseDetailState.error(message: $message)';
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
    @required
        Result loaded(List<CourseFile> files, List<Announcement> announcements),
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
    Result loaded(List<CourseFile> files, List<Announcement> announcements),
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

abstract class Error implements CourseDetailState {
  const factory Error(String message) = _$Error;

  String get message;
  $ErrorCopyWith<Error> get copyWith;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$CourseDetailStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'CourseDetailState.loading()';
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
    @required
        Result loaded(List<CourseFile> files, List<Announcement> announcements),
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
    Result loaded(List<CourseFile> files, List<Announcement> announcements),
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

abstract class Loading implements CourseDetailState {
  const factory Loading() = _$Loading;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({List<CourseFile> files, List<Announcement> announcements});
}

class _$LoadedCopyWithImpl<$Res> extends _$CourseDetailStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object files = freezed,
    Object announcements = freezed,
  }) {
    return _then(Loaded(
      files == freezed ? _value.files : files as List<CourseFile>,
      announcements == freezed
          ? _value.announcements
          : announcements as List<Announcement>,
    ));
  }
}

class _$Loaded implements Loaded {
  const _$Loaded(this.files, this.announcements)
      : assert(files != null),
        assert(announcements != null);

  @override
  final List<CourseFile> files;
  @override
  final List<Announcement> announcements;

  @override
  String toString() {
    return 'CourseDetailState.loaded(files: $files, announcements: $announcements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)) &&
            (identical(other.announcements, announcements) ||
                const DeepCollectionEquality()
                    .equals(other.announcements, announcements)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(announcements);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(String message),
    @required Result loading(),
    @required
        Result loaded(List<CourseFile> files, List<Announcement> announcements),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loaded(files, announcements);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(String message),
    Result loading(),
    Result loaded(List<CourseFile> files, List<Announcement> announcements),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(files, announcements);
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

abstract class Loaded implements CourseDetailState {
  const factory Loaded(
      List<CourseFile> files, List<Announcement> announcements) = _$Loaded;

  List<CourseFile> get files;
  List<Announcement> get announcements;
  $LoadedCopyWith<Loaded> get copyWith;
}
