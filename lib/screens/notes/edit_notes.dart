import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter/widgets.dart";
import 'package:projek_akhir_f07/screens/notes/notes_model.dart';

class NoteScreen extends StatefulWidget {
  final Notes _note;
  NoteScreen({Key? key, note}) : _note = note;

  @override
  State<StatefulWidget> createState() {
    return NoteScreenState(note: _note);
  }
}

class NoteScreenState extends State<NoteScreen> {
  final Notes _note;
  NoteScreenState({Key? key, note}) : _note = note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_note.body)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                  hintText: 'Write your note here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20)),
            )),
          )
        ],
      ),
    );
  }
}
