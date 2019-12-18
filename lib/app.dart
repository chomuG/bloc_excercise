import 'package:bloc_test_app/blocs/timer_bloc/timer_bloc.dart';
import 'package:bloc_test_app/pages/counter/counter.dart';
import 'package:bloc_test_app/home.dart';
import 'package:bloc_test_app/pages/timer/ticker.dart' as prefix0;
import 'package:bloc_test_app/pages/timer/timer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTest extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => HomePage(),
    '/counter': (BuildContext context) => CounterPage(),
    '/timer': (BuildContext context) => TimerPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<TimerBloc>(
          create: (BuildContext context) => TimerBloc(ticker: prefix0.Ticker()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: Color(0xFFF7F7F7),
            appBarTheme: AppBarTheme(
              elevation: 0.0,
            )),
        initialRoute: '/',
        home: HomePage(),
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
