import 'package:bloc_test_app/blocs/tab_bloc/bloc.dart';
import 'package:bloc_test_app/blocs/timer_bloc/timer_bloc.dart';
import 'package:bloc_test_app/pages/authentication/authentication.dart';
import 'package:bloc_test_app/pages/authentication/simple_bloc_delegate.dart';
import 'package:bloc_test_app/pages/authentication/user_repository.dart';
import 'package:bloc_test_app/pages/counter/counter.dart';
import 'package:bloc_test_app/home.dart';
import 'package:bloc_test_app/pages/timer/ticker.dart' as prefix0;
import 'package:bloc_test_app/pages/timer/timer.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/blocs/todo_blocs.dart';
import 'package:bloc_test_app/pages/todo/localization.dart';
import 'package:bloc_test_app/pages/todo/screen/screen.dart';
import 'package:bloc_test_app/pages/todo/screen/todo_home.dart';
import 'package:todos_repository_simple/todos_repository_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:bloc_test_app/models/models.dart';
import 'blocs/authentication_bloc/bloc.dart';

class BlocTest extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => HomePage(),
    '/counter': (BuildContext context) => CounterPage(),
    '/timer': (BuildContext context) => TimerPage(),
    '/authentication': (BuildContext context) => AuthenticationPage(),
    '/todo': (context) => TodoPage(),
    '/addTodo': (context) {
      return AddEditScreen(
        key: ArchSampleKeys.addTodoScreen,
        onSave: (task, note) {
          BlocProvider.of<TodosBloc>(context).add(
            AddTodo(Todo(task, note: note)),
          );
        },
        isEditing: false,
      );
    },
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
        BlocProvider<TodosBloc>(
          create: (context) {
            return TodosBloc(
              todosRepository: const TodosRepositoryFlutter(
                fileStorage: const FileStorage(
                  '__flutter_bloc_app__',
                  getApplicationDocumentsDirectory,
                ),
              ),
            )..add(LoadTodos());
          },
        ),
        BlocProvider<TabBloc>(
          create: (context) => TabBloc(),
        ),
        BlocProvider<FilteredTodosBloc>(
          create: (context) => FilteredTodosBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
        BlocProvider<StatsBloc>(
          create: (context) => StatsBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: Color(0xFFF7F7F7),
            appBarTheme: AppBarTheme(
              elevation: 0.0,
            )),
        initialRoute: '/',
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
          FlutterBlocLocalizationsDelegate(),
        ],
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
