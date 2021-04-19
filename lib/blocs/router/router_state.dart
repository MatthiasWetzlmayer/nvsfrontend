part of 'router_bloc.dart';

@immutable
abstract class RouterState {}

class RouterInitialState extends RouterState {
  String route;
  RouterInitialState(this.route);
}