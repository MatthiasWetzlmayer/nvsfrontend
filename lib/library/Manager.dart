import 'package:nvsfrontend/blocs/dataformbloc/dataform_bloc.dart';
import 'package:nvsfrontend/blocs/login/login_bloc.dart';
import 'package:nvsfrontend/blocs/router/router_bloc.dart';
import 'package:nvsfrontend/blocs/usertable/usertable_bloc.dart';
import 'package:nvsfrontend/shared/userrepository.dart';

import 'CustomBloc.dart';
import 'Store.dart';

class BlocManager {
  static BlocManager _instance;
  Map<dynamic, CustomBloc> _map;
  static Store _store;
  
    BlocManager._() {
      _map = new Map();
      var _userRepo = new UserRepository();
      _registerBloc(RouterBloc, RouterBloc());
      _registerBloc(LoginBloc, LoginBloc(_userRepo));
      _registerBloc(UsertableBloc, UsertableBloc(_userRepo));
      _registerBloc(DataformBloc, DataformBloc(_userRepo));
    }
  
    _registerBloc(dynamic d, CustomBloc bloc) {
      _map[d] = bloc;
    }
  
    getBloc(dynamic d) {
      return _map[d];
    }
  
    dispatchEvent(CustomEvent event) {
      for (var bloc in _map.values) {
        var e = bloc.mapCustomEventToEvent(event);
        if (e != null) {
          bloc.add(e);
        }
      }
    }
  
    static BlocManager getInstance() {
      if (_instance == null) {
        _instance = new BlocManager._();
      }
      return _instance;
    }
    static Store getStore(){
      if(_store==null){
        _store=new Store();
      }
      return _store;
    }
  }
  

