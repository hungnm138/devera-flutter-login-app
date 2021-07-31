import 'package:flutter/material.dart';
import 'package:flutter_login_app/blocs/authentication_bloc.dart';
import 'package:flutter_login_app/blocs/credentials_bloc.dart';
import 'package:flutter_login_app/localization/app_localization.dart';
import 'package:flutter_login_app/repository/user_repository/test_repository.dart';
import 'package:flutter_login_app/widgets/login_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// First widget to appear when the application starts containing
/// the [LoginForm] form.
class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final repository = context.select((TestUserRepository u) => u);
    final authBloc = context.watch<AuthenticationBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize("title")),
      ),
      body: BlocProvider<CredentialsBloc>(
        create: (context) => CredentialsBloc(
          authenticationBloc: authBloc,
          userRepository: repository,
        ),
        child: const Center(child: LoginForm()),
      ),
    );
  }
}
