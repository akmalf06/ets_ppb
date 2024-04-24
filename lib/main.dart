import 'package:flutter/material.dart';
import 'package:todoapp/pages/book/create.dart';
import 'package:todoapp/pages/book/index.dart';
import 'package:todoapp/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/todo': (context) => BookApp(),
      '/todo/add': (context) => BookAddEdit(),
    },
  ));
}