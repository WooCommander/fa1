import 'package:equatable/equatable.dart';

// События для управления пользователем
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateUserName extends UserEvent {
  final String name;

  UpdateUserName(this.name);

  @override
  List<Object> get props => [name];
}
