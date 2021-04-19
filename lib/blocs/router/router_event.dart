part of 'router_bloc.dart';

@immutable
abstract class RouterEvent {}
class NewRouteEvent extends RouterEvent{
  String route;
  NewRouteEvent(this.route);
}

class CustomChangeRouteEvent extends CustomEvent{
  String route;
  CustomChangeRouteEvent(this.route);
}