import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projek_akhir_f07/models/motivasiModels.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesan Motivasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCustomForm5(),
    );
  }
}

class Motivasisc extends StatefulWidget {
  static const routeName = '/motivasi';
  const Motivasisc({Key? key}) : super(key: key);
  @override
  Motivasiscreen createState() => Motivasiscreen();
}

class Motivasiscreen extends State<Motivasisc> {
  var to = '';
  var pesan = '';
  static List<Motivasi> extractData = [];

  fetchData() async {
    const url = 'https://notedote.herokuapp.com/motivasi/json/';
    try {
      extractData = [];
      final response = await http.get(Uri.parse(url));
      // print(response.body);
      final dataJson = jsonDecode(response.body);
      for (var i in dataJson) {
        Fields fields = Fields(
          to: i["fields"]["to"],
          pesan: i["fields"]["pesan"],
        );
        Motivasi isiMotivasi =
            Motivasi(model: i["model"], pk: i["pk"], fields: fields);
        extractData.add(isiMotivasi);

        setState(() {});
      }
      return extractData;
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void deletePesan(id) {
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kumpulan Pesan Motivasi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: extractData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(
                    "To : ${extractData[index].fields.to} \n Pesan : ${extractData[index].fields.pesan} \n "),
                onTap: () {},
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyCustomForm5()));
        },
        tooltip: 'Tambah Pesan',
      ),
    );
  }
}

class MyCustomForm5 extends StatefulWidget {
  const MyCustomForm5({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm5> {
  final _formKey = GlobalKey<FormState>();
  final toController = TextEditingController();
  final pesanController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pesanController.dispose();
    toController.dispose();
    super.dispose();
  }

  void postData(String to, String pesan) async {
    try {
      setState(() {});
      // ignore: empty_catches
    } catch (er) {}
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Pesan Motivasi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('To: '),
              TextFormField(
                controller: toController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const Text('Pesan: '),
              TextFormField(
                controller: pesanController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    postData(toController.text, pesanController.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Motivasisc()));
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
