import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';
import '../cookie_request.dart';

Future<List> getJsonData(http.Client client) async {
  var response = await client.get(
    Uri.parse("https://notedote.herokuapp.com/static/img-urls.json"),
  );
  return jsonDecode(response.body)["images"];
}

class ProfileEditScreen extends StatefulWidget {
  static const routeName = '/edit-profile';
  const ProfileEditScreen({Key? key}) : super(key: key);
  @override
  _ProfileEditScreen createState() => _ProfileEditScreen();
}

class _ProfileEditScreen extends State<ProfileEditScreen> {
  final _nameController = TextEditingController();
  final _aboutController = TextEditingController();

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: _aboutController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'About',
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Select your profile picture',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              FutureBuilder<List>(
                  future: getJsonData(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(
                        child: Text('An error has occurred!'),
                      );
                    } else if (snapshot.hasData) {
                      return GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 4,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 0
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![0]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 1),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 1
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![1]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 2
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![2]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 3
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![3]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 4),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 4
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![4]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 5
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![5]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 6
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![6]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 7),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 7
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![7]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 8
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![8]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 9),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == 9
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data![9]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              Align(
                  child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  print("print");
                },
              )),
            ])));
  }
}
