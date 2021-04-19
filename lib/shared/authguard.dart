import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:nvsfrontend/blocs/router/router_bloc.dart';
import 'package:nvsfrontend/library/Manager.dart';

class AuthGuard extends StatelessWidget{
  Widget child;
  AuthGuard(this.child);

  @override
  Widget build(BuildContext context) {
    var token = BlocManager.getStore().token;
    
    if(token == null){
      BlocManager.getInstance().getBloc(RouterBloc).add(NewRouteEvent("/login"));
      return SizedBox();
    }else{
      return this.child;
    }
  }
  
}