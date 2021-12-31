// model of notes
class Notes {
  String id;
  String body;

  static const String defaultName = 'New note';

  Notes({required this.id, this.body = ''});

  String get notesBody {
    return body.isNotEmpty ? body : Notes.defaultName;
  }
}
