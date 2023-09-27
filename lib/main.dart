import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myhome.dart';
import 'mystate.dart';

//UI = f(State)

void main() {
  MyState state = MyState();
  state.fetchTodos();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHome());
  }
}
