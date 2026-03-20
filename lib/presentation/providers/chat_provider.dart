import 'package:flutter/material.dart';
import 'package:smart_assistant_app/data/models/chat_model.dart';
import 'package:smart_assistant_app/data/services/api_service.dart';


class ChatProvider extends ChangeNotifier {

  List<ChatMessage> messages = [];

  bool isLoading = false;

  Future<void> sendMessage(String text) async {

    messages.add(ChatMessage(sender: "user", message: text));

    isLoading = true;
    notifyListeners();

    final reply = await ApiService().sendMessage(text);

    messages.add(ChatMessage(sender: "assistant", message: reply));

    isLoading = false;

    notifyListeners();
  }
}