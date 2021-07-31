import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_app/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_login_app/blocs/authentication_bloc/events.dart';
import 'package:flutter_login_app/repository/user_repository.dart';

import 'events.dart';
import 'states.dart';

/// Manages the login state of the app
class CredentialsBloc extends Bloc<CredentialsEvent, CredentialsState> {
  /// Data about the user
  final UserRepository userRepository;

  /// The AuthenticationBloc taking care of changing pages
  final AuthenticationBloc authenticationBloc;

  /// Creates a Bloc taking care of managing the login state of the app
  CredentialsBloc({
    required this.authenticationBloc,
    required this.userRepository,
  }) : super(const CredentialsInitial());

  @override
  Stream<CredentialsState> mapEventToState(CredentialsEvent event) async* {
    if (event is LoginButtonPressed) {
      yield* _loginPressed(event);
    }

    if (event is RegisterButtonPressed) {
      yield* _registerPressed(event);
    }
  }

  Stream<CredentialsState> _loginPressed(CredentialsEvent event) async* {
    yield const CredentialsLoginLoading();

    try {
      final success =
          await userRepository.authenticate(event.username, event.password);

      if (success) {
        authenticationBloc.add(const LoggedIn());
        yield const CredentialsInitial();
      } else {
        yield const CredentialsLoginFailure();
      }
    } on FirebaseAuthException {
      yield const CredentialsLoginFailure();
    }
  }

  Stream<CredentialsState> _registerPressed(CredentialsEvent event) async* {
    yield const CredentialsRegisterLoading();

    try {
      final success =
          await userRepository.register(event.username, event.password);

      if (success) {
        authenticationBloc.add(const LoggedIn());
        yield const CredentialsInitial();
      } else {
        yield const CredentialsRegisterFailure();
      }
    } on FirebaseAuthException {
      yield const CredentialsRegisterFailure();
    }
  }
}
