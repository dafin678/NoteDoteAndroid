class Journal {
  int id;
  String title;
  String text;

  Journal({
    required this.id, 
    required this.title, 
    required this.text,});

  factory Journal.fromJson(Map<String, dynamic> json) {
    return Journal(
        id: json['id'], title: json['title'], text: json['text']);
  }
  dynamic toJson() => {'id': id, 'title': title, 'text': text};
}