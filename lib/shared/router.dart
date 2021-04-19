import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nvsfrontend/blocs/router/router_bloc.dart';
import 'package:nvsfrontend/library/Manager.dart';
import 'package:nvsfrontend/shared/routes.dart';

class RouterComponent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterBloc, RouterState>(
      bloc: BlocManager.getInstance().getBloc(RouterBloc),
      builder: (context, RouterState state){
        if(state is RouterInitialState){
          return Routes.Route(state.route);
        }
        return Center(
          child:  Text("Error")
          );
      });
    
  }
  
} 