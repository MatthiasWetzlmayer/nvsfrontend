part of 'usertable_bloc.dart';

@immutable
abstract class UsertableEvent {}

class LoadUsers extends UsertableEvent{
  String search;
  LoadUsers(this.search);
}
