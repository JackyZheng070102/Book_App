import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a new book
  Future<void> addBook(Map<String, dynamic> bookData) async {
    await _db.collection('books').add(bookData);
  }

  // Get books stream
  Stream<List<DocumentSnapshot>> getBooksStream() {
    return _db.collection('books').snapshots().map((snapshot) =>
        snapshot.docs);
  }
}
