import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nvsfrontend/library/CustomBloc.dart';
import 'package:nvsfrontend/library/Manager.dart';
import 'package:nvsfrontend/shared/models/fulluser.dart';
import 'package:nvsfrontend/shared/userrepository.dart';

import 'package:rxdart/rxdart.dart';
part 'usertable_event.dart';
part 'usertable_state.dart';

class UsertableBloc extends CustomBloc<UsertableEvent, UsertableState> {
  UserRepository _userRepo;
  UsertableBloc(this._userRepo);

  @override
  Stream<UsertableState> mapEventToState(
    UsertableEvent event,
  ) async* {
    if (event is LoadUsers) {
      if (!(state is UsertableLoading)) {
        yield UsertableLoading();
      }
        var users = await _userRepo.searchUsers(event.search, BlocManager.getStore().token);
        yield UsertableLoaded(users);
      
    }
  }

 @override
  Stream<Transition<UsertableEvent, UsertableState>> transformEvents(Stream<UsertableEvent> events, transitionFn) {
    // TODO: implement transformEvents
    return super.transformEvents(events.debounceTime(new Duration(milliseconds: 2000)), transitionFn);
  }
 
  @override
  // TODO: implement initialState
  UsertableState get initialState => UsertableLoading();

  @override
  UsertableEvent mapCustomEventToEvent(CustomEvent event) {
    return null;
  }
}
