import 'package:equatable/equatable.dart';
import '../../data/models/user.dart';

// Состояние пользователя
class UserState extends Equatable {
  final User user;

  UserState({required this.user});

  @override
  List<Object> get props => [user];
}
