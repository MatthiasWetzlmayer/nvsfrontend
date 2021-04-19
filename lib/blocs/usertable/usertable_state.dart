part of 'usertable_bloc.dart';

@immutable
abstract class UsertableState {}

class UsertableLoading extends UsertableState {}
class UsertableLoaded extends UsertableState {
  List<FullUser> users;
  UsertableLoaded(this.users);
}
