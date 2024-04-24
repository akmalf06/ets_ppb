import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp/db/book_db.dart';
import 'package:todoapp/models/book.dart';

class BookAddEdit extends StatefulWidget {
  final Book? book;

  const BookAddEdit({
    Key? key,
    this.book
  }) : super(key: key);

  @override
  State<BookAddEdit> createState() => _BookAddEditState();
}

class _BookAddEditState extends State<BookAddEdit> {
  final _formKey = GlobalKey<FormState>();

  late String title, description, coverUrl;

  @override
  void initState(){
    super.initState();
    title = widget.book?.title ?? "";
    description = widget.book?.description ?? "";
    coverUrl = widget.book?.coverUrl ?? "";
  }

  Future updateBook() async {
    final book = widget.book!.copy(
      title: title,
      description: description,
      coverUrl: coverUrl
    );
  }

  Future addBook() async {
    final book = Book(title: title, description: description, coverUrl: coverUrl, createdAt: DateTime.now());
    await BookDatabase.instance.create(book);
  }

  void addOrUpdate() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.book != null;

      if (isUpdating) {
        await updateBook();
      } else {
        await addBook();
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Add Activity",
            style: TextStyle(
                fontFamily: 'roboto',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Title cannot be empty!";
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() {
                      title = value as String;
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Description cannot be empty!";
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() {
                      description = value as String;
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Cover URL"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Cover cannot be empty!";
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() {
                      coverUrl = value as String;
                    }),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("$title, $description");
                    }
                  },
                  child: Text(
                    'Add Activity',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
