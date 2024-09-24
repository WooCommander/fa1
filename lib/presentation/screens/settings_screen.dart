import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/user/user_bloc.dart';
import '../../logic/user/user_event.dart';
import '../../logic/user/user_state.dart';

class SettingsScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Поле для ввода имени
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // Поле для ввода возраста
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _ageController.text.isNotEmpty) {
                  final int age = int.tryParse(_ageController.text) ?? 0;
                  if (age > 0) {
                    context.read<UserBloc>().add(UpdateUserName(_nameController.text));
                    Navigator.pop(context);
                  }
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
