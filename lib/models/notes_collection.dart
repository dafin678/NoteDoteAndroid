import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/models/notes_model.dart';

// list of created notes
class NotesCollection extends ChangeNotifier {
  final List<Notes> _notes = [];

  get allNotes => _notes;

  Notes getNotes(String id) {
    return _notes.where((note) => note.id == id).first;
  }

  void addNotes(Notes note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNotes(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  void updateNotes(String id, String body) {
    var currentNote = _notes.where((note) => note.id == id).first;
    currentNote.body = body;
    notifyListeners();
  }
}
