import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/user/user_bloc.dart';
import '../../logic/user/user_state.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Аватар пользователя
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.jpg'), // Добавь картинку в папку assets
            ),
            SizedBox(height: 16.0),
            // Информация о пользователе
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${state.user.name}',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Age: ${state.user.age}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
