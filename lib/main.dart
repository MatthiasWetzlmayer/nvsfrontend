import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nvsfrontend/blocs/router/router_bloc.dart';
import 'package:nvsfrontend/components/navbar.dart';
import 'package:nvsfrontend/library/Manager.dart';
import 'package:nvsfrontend/shared/router.dart';

void main() {
  print("main");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: NavBar()
            ),
            Expanded(
              flex: 3,
              child: RouterComponent()
            ),
          ],
        ),
      )
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //

    return null;
  }
}
