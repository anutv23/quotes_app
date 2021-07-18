import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/views/dashboard.dart';
import 'package:velocity_x/velocity_x.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFFB999),
          accentColor: Color(0xFFFF8F5C),
          backgroundColor: Color(0xFFFFE5D9),
      // primarySwatch: Colors.orange,
          appBarTheme: AppBarTheme(
            centerTitle: true,
              textTheme: TextTheme(
                  headline1: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                 // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic)
                 ),
              iconTheme: IconThemeData(
                  color:  Color(0xFFFF8F5C),
              )
          )
      ),
      home: Dashboard(),
    );
  }
}
