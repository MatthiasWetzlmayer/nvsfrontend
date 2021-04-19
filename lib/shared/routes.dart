import 'package:flutter/widgets.dart';
import 'package:nvsfrontend/components/data.dart';
import 'package:nvsfrontend/components/login_register.dart';
import 'package:nvsfrontend/components/usertable.dart';
import 'package:nvsfrontend/shared/authguard.dart';

class Routes{
  static Widget Route(String route){
    if(route == "/overview" || route == "/"){
      return AuthGuard(UserTable());
    }else if(route == "/login"){
      return LoginRegister();
    }else if(route == "/data"){
      return AuthGuard(DataForm());
    }
  }
}