import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nvsfrontend/blocs/router/router_bloc.dart';
import 'package:nvsfrontend/library/CustomBloc.dart';
import 'package:nvsfrontend/library/Manager.dart';
import 'package:nvsfrontend/shared/models/token.dart';
import 'package:nvsfrontend/shared/models/user.dart';
import 'package:nvsfrontend/shared/userrepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends CustomBloc<LoginEvent, LoginState> {
  UserRepository _userRepo;
  LoginBloc(this._userRepo);
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is ClickedEvent) {
      print("RegisterClickedEvent");
      var u = User(
        username: event.username,
        password: event.password
      );

      Token token = null;
      if(event is RegisterClickedEvent){
        token = await this._userRepo.postRegisterUser(u);
      }else{
        token = await this._userRepo.postLoginUser(u);
      }
      BlocManager.getStore().token = token.token;
      BlocManager.getInstance().dispatchEvent(CustomChangeRouteEvent("/"));
      print(BlocManager.getStore().token);
    }
  }

  @override
  LoginState get initialState => LoginInitial();

  @override
  LoginEvent mapCustomEventToEvent(CustomEvent event) {
    return null;
  }
}
