import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_assistant_app/presentation/providers/chat_provider.dart';
import 'package:smart_assistant_app/presentation/providers/suggestion_provider.dart';
import 'package:smart_assistant_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SuggestionProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Smart Assistant",
theme: ThemeData(
  primarySwatch: Colors.blue,

  scaffoldBackgroundColor: Colors.grey.shade100,

  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
),
        home: const HomeScreen(),
      ),
    );
  }
}