import 'package:flutter/material.dart';
import 'book.dart'; // Make sure this import points to where your Book model is defined
import 'google_books_api.dart'; // Ensure you have this service implemented

class BooksListScreen extends StatefulWidget {
  @override
  _BooksListScreenState createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  late Future<List<Book>> _books;

  @override
  void initState() {
    super.initState();
    _books = GoogleBooksApi().fetchBooks('flutter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books List'),
      ),
      body: FutureBuilder<List<Book>>(
        future: _books,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Book book = snapshot.data![index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  onTap: () {
                    // Navigate to book details page or handle tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
