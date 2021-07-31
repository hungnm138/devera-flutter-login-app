import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_login_app/blocs/authentication_bloc.dart';
import 'package:flutter_login_app/blocs/credentials_bloc.dart';
import 'package:flutter_login_app/repository/user_repository/test_repository.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  final successRepository = const TestUserRepository(
    fakeEmail: "hungnm@devera.vn",
    success: true,
  );

  final failedRepository = const TestUserRepository(
    fakeEmail: "hungnm@fail.devera.vn",
    success: false,
  );

  // ignore: close_sinks
  final AuthenticationBloc authBloc = MockAuthenticationBloc();

  blocTest<CredentialsBloc, CredentialsState>('Successful login',
      build: () => CredentialsBloc(
          authenticationBloc: authBloc, userRepository: successRepository),
      act: (bloc) => bloc.add(const LoginButtonPressed(
          username: "hungnm@devera.vn", password: "123456")),
      expect: () => <CredentialsState>[
            CredentialsLoginLoading(),
            CredentialsInitial(),
          ]);

  blocTest<CredentialsBloc, CredentialsState>('Successful registration',
      build: () => CredentialsBloc(
          authenticationBloc: authBloc, userRepository: successRepository),
      act: (bloc) => bloc.add(const RegisterButtonPressed(
          username: "hungnm@devera.vn", password: "123456")),
      expect: () => <CredentialsState>[
            CredentialsRegisterLoading(),
            CredentialsInitial(),
          ]);

  blocTest<CredentialsBloc, CredentialsState>('Failed login',
      build: () => CredentialsBloc(
          authenticationBloc: authBloc, userRepository: failedRepository),
      act: (bloc) => bloc.add(const LoginButtonPressed(
          username: "hungnm@devera.vn", password: "123456")),
      expect: () => <CredentialsState>[
            CredentialsLoginLoading(),
            CredentialsLoginFailure(),
          ]);

  blocTest<CredentialsBloc, CredentialsState>('Failed registration',
      build: () => CredentialsBloc(
          authenticationBloc: authBloc, userRepository: failedRepository),
      act: (bloc) => bloc.add(const RegisterButtonPressed(
          username: "hungnm@devera.vn", password: "123456")),
      expect: () => <CredentialsState>[
            CredentialsRegisterLoading(),
            CredentialsRegisterFailure(),
          ]);
}
