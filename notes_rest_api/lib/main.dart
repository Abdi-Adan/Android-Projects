import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_rest_api/services/notes_service.dart';
import 'package:notes_rest_api/views/notes_list.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NotesService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scribe',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: NoteList(),
    );
  }
}