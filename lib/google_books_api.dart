import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleBooksApi {
  final String apiKey = 'YOUR_API_KEY';  // Replace with your actual Google Books API key
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<dynamic> fetchBooks(String query) async {
    try {
      final response = await http.get('$baseUrl?q=$query&key=$apiKey');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // You can process the data further if needed or return it directly
        return data;
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }
}
