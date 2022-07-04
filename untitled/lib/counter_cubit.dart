import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 0));



  void incrementCounter(int counter) {
    emit(CounterState(counter: counter++));
  }

  void decrementCounter(int counter) {
    emit(CounterState(counter: counter--));
  }
}


