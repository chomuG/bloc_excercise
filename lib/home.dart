import 'package:bloc_test_app/pages/authentication/authentication.dart';
import 'package:bloc_test_app/pages/authentication/user_repository.dart';
//import 'package:user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class HomePage extends StatefulWidget {
  final UserRepository _userRepository;

  HomePage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bloc 패턴 테스트'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(
                  'Counter bloc example',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/counter');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(
                  'Timer bloc example',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/timer');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(
                  'Firebase Login Example',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AuthenticationPage(
                        userRepository: widget._userRepository,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(
                  'Firestore Todo Example',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/todo');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(
                  'Recipe : SnackBar',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/snackbar');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(
                  'Recipe : Navigation(Direct)',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/navi1');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: ListTile(
                title: Text(
                  'Recipe : Navigation(Route)',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/navi2');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
