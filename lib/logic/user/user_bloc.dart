import 'package:bloc/bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import '../../data/models/user.dart';
import '../../data/database_helper.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  UserBloc() : super(UserState(user: User(name: 'John Doe', age: 25))) {
    // Загружаем пользователя из базы данных при инициализации блока
    _loadUserFromDatabase();

    on<UpdateUserName>((event, emit) async {
      if (event.name.isNotEmpty) {
        final updatedUser = state.user.copyWith(name: event.name);
        await _databaseHelper.updateUser(updatedUser, 1);
        emit(UserState(user: updatedUser));
      }
    });
  }

  Future<void> _loadUserFromDatabase() async {
    final user = await _databaseHelper.getUser(1);
    if (user != null) {
      emit(UserState(user: user));
    }
  }
}
