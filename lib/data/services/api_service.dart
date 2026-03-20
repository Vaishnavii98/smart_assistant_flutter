import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<dynamic>> getSuggestions(int page) async {

    final response = await http.get(
      Uri.parse("https://dummyjson.com/posts?limit=10&skip=${(page - 1) * 10}"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["posts"];
    } else {
      throw Exception("Failed to load suggestions");
    }
  }

  Future<String> sendMessage(String message) async {

    await Future.delayed(const Duration(seconds: 1));

    return "Assistant reply: $message";
  }

  Future<List<dynamic>> getChatHistory() async {

    final response = await http.get(
      Uri.parse("https://dummyjson.com/comments?limit=20"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["comments"];
    } else {
      throw Exception("Failed to load history");
    }
  }
}