import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/screens/notes/edit_notes.dart';
import 'package:projek_akhir_f07/screens/notes/notes_collection.dart';
import 'package:projek_akhir_f07/screens/notes/notes_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class NoteHome extends StatelessWidget {
  var uuid = const Uuid();
  var collection = NotesCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
        ),
        body: _buildNotesList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
            Notes note = Notes(
              id: uuid.v4()
            );
            
            Provider.of<NotesCollection>(context).addNotes(note);
            
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NoteScreen(
                  note: note
                )
              )
            );
          },
        )
    );
  }

  Widget _buildNotesList() {
        return Consumer<NotesCollection>(
          builder: (context, notes, child) {
            var allNotes = notes.allNotes;

        if (allNotes.length == 0) {
          return Center(
            child: Text('No notes here......'),
          );
        }

        return ListView.builder(
          itemCount: allNotes.noteCount,
          itemBuilder: (context, index) {
            var note = allNotes[index];

            return ListTile(
              title: Text(note.body),
            );
          },
        );
      }
    );
  }
}