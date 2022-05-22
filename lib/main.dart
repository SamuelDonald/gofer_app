import 'package:flutter/material.dart';
import 'package:gofer_app/screens/home/home.dart';
import 'package:gofer_app/utilities/services.dart';
import 'package:gofer_app/utilities/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ServiceClass(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gofer',
      theme: lightThemeData(context),
      //darkTheme: darkThemeData(context),
      debugShowCheckedModeBanner: false,
      home: AccountSet(),
    );
  }
}
