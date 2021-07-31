import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_login_app/blocs/authentication_bloc.dart';
import 'package:flutter_login_app/repository/user_repository/test_repository.dart';

void main() {
  final authenticationRepository = const TestUserRepository(
    fakeEmail: "hungnm@devera.vn",
    success: true,
  );

  blocTest<AuthenticationBloc, AuthenticationState>(
    'Authentication successful',
    build: () => AuthenticationBloc(authenticationRepository),
    act: (bloc) => bloc.add(const LoggedIn()),
    expect: () => <AuthenticationState>[
      AuthenticationSuccess(),
    ],
  );

  blocTest<AuthenticationBloc, AuthenticationState>(
    'Authentication failed',
    build: () => AuthenticationBloc(authenticationRepository),
    act: (bloc) => bloc.add(const LoggedOut()),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationRevoked(),
    ],
  );
}
