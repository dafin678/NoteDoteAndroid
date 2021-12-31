// model of notes
class Notes {
  String id;
  String body;

  static const String DEFAULT_NAME = 'New note';

  Notes({required this.id, this.body = ''});

  String get notesBody {
    return body.isNotEmpty ? body : Notes.DEFAULT_NAME;
  }
}
