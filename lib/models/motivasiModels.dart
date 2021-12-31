// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_unnecessary_containers, avoid_print, file_names, unused_import, prefer_const_constructors

import 'dart:convert';

// ignore: non_constant_identifier_names
List<Motivasi> IsiPesanFromJson(String str) =>
    List<Motivasi>.from(json.decode(str).map((x) => Motivasi.fromJson(x)));

// ignore: non_constant_identifier_names
String IsiPesanToJson(List<Motivasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['pk'] = pk;
    data['fields'] = fields.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    data['pesan'] = pesan;
    return data;
  }
}
