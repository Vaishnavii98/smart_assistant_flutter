import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suggestion_provider.dart';
import 'chat_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        Provider.of<SuggestionProvider>(context, listen: false)
            .fetchSuggestions());
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<SuggestionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Assistant"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryScreen(),
                ),
              );
            },
          )
        ],
      ),
body: provider.suggestions.isEmpty
    ? const Center(child: CircularProgressIndicator())
    : ListView.builder(
        itemCount: provider.suggestions.length,
        itemBuilder: (context, index) {

          final item = provider.suggestions[index];

          if (index == provider.suggestions.length - 1) {
            provider.fetchSuggestions();
          }

                 return ListTile(
            title: Text(item["title"]),
            subtitle: Text(item["body"]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    prompt: item["title"],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}