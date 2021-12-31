// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/models/notes_collection.dart';
import 'package:projek_akhir_f07/models/notes_model.dart';
import 'package:projek_akhir_f07/models/edit_notes.dart';
import 'package:projek_akhir_f07/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class NoteHome extends StatefulWidget {
  static const routeName = '/notes';

  const NoteHome({Key? key}) : super(key: key);

  @override
  _NoteHome createState() => _NoteHome();
}

class _NoteHome extends State<NoteHome> {
  var uuid = const Uuid();
  var collection = NotesCollection();

  @override
  Widget build(BuildContext context) {
    Notes note;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: _buildNotesList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          note = Notes(id: uuid.v4()),
          Provider.of<NotesCollection>(context, listen: false).addNotes(note),
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NoteScreen(notes: note)))
        },
      ),
      drawer: const MainDrawer(),
    );
  }

  Widget _buildNotesList() {
    return Consumer<NotesCollection>(builder: (context, notes, child) {
      var allNotes = notes.allNotes;

      if (allNotes.length == 0) {
        return const Center(
          child: Text('No notes here'),
        );
      }

      return ListView.builder(
        itemCount: allNotes.length,
        itemBuilder: (context, index) {
          var note = allNotes[index];

          return Dismissible(
              key: Key(note.id),
              onDismissed: (direction) {
                Provider.of<NotesCollection>(context, listen: false)
                    .deleteNotes(note.id);
              },
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Card(
                child: ListTile(
                    title: Text(note.notesBody),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NoteScreen(notes: note)));
                    }),
              ));
        },
      );
    });
  }
}
