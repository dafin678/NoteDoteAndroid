import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter/widgets.dart";
import 'package:projek_akhir_f07/models/notes_collection.dart';
import 'package:projek_akhir_f07/models/notes_model.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  final Notes _notes;
  NoteScreen({Key? key, notes}) : _notes = notes;

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return NoteScreenState(notes: _notes);
  }
}

class NoteScreenState extends State<NoteScreen> {
  final Notes _notes;
  NoteScreenState({Key? key, notes}) : _notes = notes;

  final TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    bodyController.text = _notes.body;

    bodyController.addListener(() {
      Provider.of<NotesCollection>(context, listen: false)
          .updateNotes(_notes.id, bodyController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<NotesCollection>(
          builder: (context, notes, child) {
            return Text(notes.getNotes(_notes.id).notesBody);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: TextField(
              controller: bodyController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
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
