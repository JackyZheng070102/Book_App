import 'package:flutter/material.dart';
import 'books_list_screen.dart';  // Ensure you have this file with the GoogleBooksApi implementation

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BooksListScreen(),
    );
  }
}
