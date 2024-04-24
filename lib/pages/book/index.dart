import 'package:flutter/material.dart';
import 'package:todoapp/components/book_card.dart';
import 'package:todoapp/models/book.dart';

class BookApp extends StatefulWidget {
  @override
  _BookAppState createState() => _BookAppState();
}

class _BookAppState extends State<BookApp> {
  List<Book> books = [
    Book(id: 1, title: 'Tugas PPB', description: 'Tugas implementasi Stateful class, List, Custom Class, Card, Extracting Widget, dan Function as parameter', coverUrl: 'https://marketplace.canva.com/EAFY7T6tOE0/1/0/1003w/canva-oren-estetik-buku-cerita-pasangan-cinta-romantis-kartun-bagus-laGditSTCv0.jpg', createdAt: DateTime.now()),
    Book(id: 2, title: 'Belanja', description: 'Yang perlu dibeli: roti, minyak, gula, dan kertas', coverUrl: 'https://marketplace.canva.com/EAFY7T6tOE0/1/0/1003w/canva-oren-estetik-buku-cerita-pasangan-cinta-romantis-kartun-bagus-laGditSTCv0.jpg', createdAt: DateTime.now()),
    Book(id: 3, title: 'Olahraga', description: 'Otot yang perlu dilatih adalah otot dada', coverUrl: 'https://marketplace.canva.com/EAFY7T6tOE0/1/0/1003w/canva-oren-estetik-buku-cerita-pasangan-cinta-romantis-kartun-bagus-laGditSTCv0.jpg', createdAt: DateTime.now()),
  ];

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