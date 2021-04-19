import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nvsfrontend/library/CustomBloc.dart';

part 'router_event.dart';
part 'router_state.dart';

class RouterBloc extends CustomBloc<RouterEvent, RouterState> {

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    if(event is NewRouteEvent){
      yield RouterInitialState(event.route);
    }
  }

  @override
  RouterState get initialState => RouterInitialState("/");

  @override
  RouterEvent mapCustomEventToEvent(CustomEvent event) {
    if(event is CustomChangeRouteEvent){
      return NewRouteEvent(event.route);
    }
    return null;
  }
}
