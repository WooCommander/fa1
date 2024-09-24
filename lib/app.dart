import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/counter/counter_bloc.dart';
import 'logic/user/user_bloc.dart';
import 'config/routes.dart';
import 'config/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme, // Применяем тему
        onGenerateRoute: Routes.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
