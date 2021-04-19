part of 'dataform_bloc.dart';

@immutable
abstract class DataformEvent {}

class DataEntered extends DataformEvent{
  String birthdate;
  String salary;

  DataEntered(this.birthdate, this.salary);
}
