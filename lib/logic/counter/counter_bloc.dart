import 'package:bloc/bloc.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // Определяем обработчики событий
    on<IncrementCounter>((event, emit) {
      emit(state + 1); // Увеличиваем значение счетчика
    });
  }
}
