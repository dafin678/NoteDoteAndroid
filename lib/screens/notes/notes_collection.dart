import 'package:projek_akhir_f07/screens/notes.dart';
import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/screens/notes/notes_model.dart';
import 'package:provider/provider.dart';

// list of created notes
class NotesCollection extends ChangeNotifier {
  final List<Notes> _notes = [];

  get noteCount {
    return _notes.length;
  }

  get allNotes => _notes;

  void addNotes(Notes note) {
    _notes.add(note);
    notifyListeners();
  }
}
