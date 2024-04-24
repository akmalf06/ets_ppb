import 'package:flutter/material.dart';
import 'package:todoapp/db/book_db.dart';
import 'package:todoapp/models/book.dart';
import 'package:todoapp/pages/book/create.dart';

class BookDetail extends StatefulWidget {
  final int bookId;

  const BookDetail({Key? key, required this.bookId}) : super(key: key);

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late Book book;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshBook();
  }

  Future refreshBook() async {
    setState(() => isLoading = true);
    book = await BookDatabase.instance.find(widget.bookId);
    setState(() => isLoading = false);
  }

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BookAddEdit(book: book),
        ));

        refreshBook();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await BookDatabase.instance.delete(widget.bookId);

          Navigator.of(context).pop();
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book: ${book.title}"),
        actions: [editButton(), deleteButton()],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(
                book.title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '${book.createdAt.year}-${book.createdAt.month}-${book.createdAt.day}',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              Image(
                image: NetworkImage(book.coverUrl),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              Text(book.description)
            ],
          ),
        ),
      ),
    );
  }
}
