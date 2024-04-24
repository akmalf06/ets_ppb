import 'package:flutter/material.dart';
import 'package:todoapp/models/book.dart';

class BookCard extends StatelessWidget {

  final Book book;
  BookCard(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              book.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '${book.createdAt.year}-${book.createdAt.month}-${book.createdAt.day}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            Image(
              image: NetworkImage(book.coverUrl),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
