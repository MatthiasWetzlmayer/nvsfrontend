import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nvsfrontend/blocs/router/router_bloc.dart';
import 'package:nvsfrontend/library/CustomBloc.dart';
import 'package:nvsfrontend/library/Manager.dart';
import 'package:nvsfrontend/shared/models/userdatadto.dart';
import 'package:nvsfrontend/shared/userrepository.dart';

part 'dataform_event.dart';
part 'dataform_state.dart';

class DataformBloc extends CustomBloc<DataformEvent, DataformState> {
  UserRepository _userRepo;
  DataformBloc(this._userRepo);
  @override
  Stream<DataformState> mapEventToState(
    DataformEvent event,
  ) async* {
      if(event is DataEntered){
        var user = UserDataDto(
            birthdate: event.birthdate,
            salary: event.salary
        );
        await _userRepo.postUserData(user, BlocManager.getStore().token);
        BlocManager.getInstance().dispatchEvent(CustomChangeRouteEvent("/"));
      }
  }

  @override
  // TODO: implement initialState
  DataformState get initialState => DataformInitial();

  @override
  DataformEvent mapCustomEventToEvent(CustomEvent event) {
    return null;
  }
}
