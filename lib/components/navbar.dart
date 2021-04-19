import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nvsfrontend/blocs/router/router_bloc.dart';
import 'package:nvsfrontend/library/Manager.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Row(children: [
        Expanded(
          child: TextButton(
            child: Text("Userübersicht"),
            onPressed: () {
              BlocManager.getInstance()
                  .getBloc(RouterBloc)
                  .add(NewRouteEvent("/overview"));
            },
          ),
        ),
        Expanded(
          child: TextButton(
            child: Text("Dateneingabe"),
            onPressed: () {
              BlocManager.getInstance()
                  .getBloc(RouterBloc)
                  .add(NewRouteEvent("/data"));
            },
          ),
        ),
        Expanded(
          child: TextButton(
            child: Text("Login/Register"),
            onPressed: () {
              BlocManager.getInstance()
                  .getBloc(RouterBloc)
                  .add(NewRouteEvent("/login"));
            },
          ),
        ),
      ]),
    ));
  }
}
