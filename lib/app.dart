import 'package:bloc_test_app/blocs/timer_bloc/timer_bloc.dart';
import 'package:bloc_test_app/pages/authentication/authentication.dart';
import 'package:bloc_test_app/pages/authentication/simple_bloc_delegate.dart';
import 'package:bloc_test_app/pages/authentication/user_repository.dart';
import 'package:bloc_test_app/pages/counter/counter.dart';
import 'package:bloc_test_app/home.dart';
import 'package:bloc_test_app/pages/timer/ticker.dart' as prefix0;
import 'package:bloc_test_app/pages/timer/timer.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication_bloc/bloc.dart';

class BlocTest extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => HomePage(),
    '/counter': (BuildContext context) => CounterPage(),
    '/timer': (BuildContext context) => TimerPage(),
    '/authentication': (BuildContext context) => AuthenticationPage(),
  };

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized(); //flutter 1.9.4 이전 버전에서 필요
    BlocSupervisor.delegate = SimpleBlocDelegate();
    final UserRepository userRepository = UserRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<TimerBloc>(
          create: (BuildContext context) => TimerBloc(
            ticker: prefix0.Ticker(),
          ),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
            userRepository: userRepository,
          )..add(AppStarted()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: Color(0xFFF7F7F7),
            appBarTheme: AppBarTheme(
              elevation: 0.0,
            )),
        initialRoute: '/',
        home: HomePage(
          userRepository: userRepository,
        ),
        routes: routes,
        onGenerateRoute: _getRoute,
      ),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => HomePage(),
    );
  }
}
