import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nvsfrontend/blocs/login/login_bloc.dart';
import 'package:nvsfrontend/library/Manager.dart';

class LoginRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var uname = TextEditingController();
    var psw = TextEditingController();
    return Center(
        child: Form(
            child: Column(
      children: [
        TextField(
          controller: uname,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Username'),
        ),
        TextField(
          controller: psw,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Password'),
        ),
        TextButton(
            onPressed: () {
              BlocManager.getInstance()
                  .getBloc(LoginBloc)
                  .add(LoginClickedEvent(uname.text, psw.text));
            },
            child: Text("Login")),
        TextButton(
            onPressed: () {
              print("Register pressed");
              BlocManager.getInstance()
                  .getBloc(LoginBloc)
                  .add(RegisterClickedEvent(uname.text, psw.text));
            },
            child: Text("Register")),
      ],
    )));
  }
}
