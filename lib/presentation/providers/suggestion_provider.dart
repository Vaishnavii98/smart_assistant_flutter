import 'package:flutter/material.dart';
import 'package:smart_assistant_app/data/services/api_service.dart';

class SuggestionProvider extends ChangeNotifier {

  List suggestions = [];

  int page = 1;
  bool isLoading = false;

  Future<void> fetchSuggestions() async {

    if (isLoading) return;

    isLoading = true;

    final data = await ApiService().getSuggestions(page);

    suggestions.addAll(data);

    page++;

    isLoading = false;

    notifyListeners();
  }
}