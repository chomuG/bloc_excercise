import 'package:bloc_test_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bloc_test_app/blocs/authentication_bloc/authentication_state.dart';
import 'package:bloc_test_app/pages/authentication/auth_home.dart';
import 'package:bloc_test_app/pages/authentication/splash_screen.dart';
import 'package:bloc_test_app/pages/authentication/user_repository.dart';
import 'package:bloc_test_app/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  final UserRepository _userRepository;

  AuthenticationPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (context, state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Authenticated) {
              return HomeScreen(
                name: state.displayName,
              );
            }
            if (state is Unauthenticated) {
              return LoginScreen(
                userRepository: widget._userRepository,
              );
            }
            return HomeScreen();
          },
        ),
      ),
    );
  }
}
