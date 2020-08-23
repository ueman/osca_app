import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:osca_dart/app/osca_app_api.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.api) : super(const AuthState.loading());

  final OscaAppApi api;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.when(login: _login, logout: _logout);
  }

  Stream<AuthState> _login(String name, String password) async* {
    yield const AuthState.loading();

    try {
      final loggedIn = await api.login(name, password);
      if (loggedIn) {
        yield const AuthState.loggedIn();
      } else {
        yield const AuthState.loggedOut();
      }
    } catch (e) {
      yield AuthState.error(e.toString());
    }
  }

  Stream<AuthState> _logout() async* {
    yield const AuthState.loggedOut();
  }

  void logout() => add(const AuthEvent.logout());
}

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(String name, String password) = Login;
  const factory AuthEvent.logout() = Logout;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.error(String message) = Error;
  const factory AuthState.loading() = Loading;
  const factory AuthState.loggedIn() = LoggedIn;
  const factory AuthState.loggedOut() = LoggedOut;
}
