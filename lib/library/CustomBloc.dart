import 'package:bloc/bloc.dart';



abstract class CustomEvent{}

abstract class CustomBloc<E,S> extends Bloc<E,S>{
   
  E mapCustomEventToEvent(CustomEvent event);
}

