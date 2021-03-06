import 'package:flutter/material.dart';
//import 'package:metropay_test/screens/login_screen.dart';
import 'package:metropay_test/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'MetroPay_test',
        theme: ThemeData(
//          canvasColor: Color(0xffffffff),
            buttonTheme: ButtonThemeData(
              buttonColor: Color(0xffffffff),
            )
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
            canvasColor: Color(0xffffffff),
            buttonTheme: ButtonThemeData(
              buttonColor: Color(0xff454545),
            )
        ),
//      debugShowCheckedModeBanner: false, //remove comment to remove debug tag
        home: Wrapper(),
      ),
    );
  }
}

