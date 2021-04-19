part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ClickedEvent extends LoginEvent{
  String username;
  String password;
  ClickedEvent(this.username, this.password);
}

class RegisterClickedEvent extends ClickedEvent{
  RegisterClickedEvent(String username, String password) : super(username, password);
}
class LoginClickedEvent extends ClickedEvent{
  LoginClickedEvent(String username, String password) : super(username, password);
}
