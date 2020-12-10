import 'package:flutter/material.dart';
import 'package:triiapp/ui/blocs/app_bloc.dart';
import 'package:triiapp/ui/blocs/home_bloc.dart';
import 'package:triiapp/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:triiapp/ui/screens/welcome_screen.dart';
import 'package:triiapp/ui/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppBloc()..validateUser()),
        ChangeNotifierProvider(create: (context) => HomeBloc()..fetchGames())
      ],
      child: MaterialApp(
        title: 'Trii',
        theme: primaryTheme,
        home: WelcomeScreen(),
      ),
    );
  }
}
