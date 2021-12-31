import 'dart:convert';

List<Motivasi> IsiPesanFromJson(String str) =>
    List<Motivasi>.from(json.decode(str).map((x) => Motivasi.fromJson(x)));

String IsiPesanToJson(List<Motivasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: file_names
class Motivasi {
  String model;
  int pk;
  Fields fields;

  Motivasi({required this.model, required this.pk, required this.fields});

  factory Motivasi.fromJson(Map<String, dynamic> json) => Motivasi(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (fields != null) {
      data['fields'] = this.fields.toJson();
    }
    return data;
  }
}

class Fields {
  String to;
  String pesan;

  Fields({required this.to, required this.pesan});

  factory Fields.fromJson(Map<String, dynamic> json) =>
      Fields(to: json['to'], pesan: json['pesan']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = to;
    data['pesan'] = this.pesan;
    return data;
  }
}
