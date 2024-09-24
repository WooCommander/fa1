import 'package:equatable/equatable.dart';

// Определяем события для нашего блока счетчика
abstract class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {}
