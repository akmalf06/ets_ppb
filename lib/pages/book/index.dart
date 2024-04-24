import 'package:flutter/material.dart';
import 'package:todoapp/components/book_card.dart';
import 'package:todoapp/db/book_db.dart';
import 'package:todoapp/models/book.dart';

class BookApp extends StatefulWidget {
  @override
  _BookAppState createState() => _BookAppState();
}

class _BookAppState extends State<BookApp> {
  late List<Book> books;
  bool isLoading = true;

  Future refreshBooks() async {
    setState(() => isLoading = true);
    books = await BookDatabase.instance.getAll();
    setState(() => isLoading = false);
  }

  @override
  void initState(){
    super.initState();
    refreshBooks();
  }

  @override
  void dispose() {
    BookDatabase.instance.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Book Storage APP",
            style: TextStyle(
                fontFamily: 'roboto',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white
            ),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: books.map((book) => BookCard(book)).toList(),
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, '/todo/add'),
      ),
    );
  }
}
