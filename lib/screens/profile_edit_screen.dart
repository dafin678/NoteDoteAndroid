import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cookie_request.dart';
import 'profile_screen.dart';

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
  String _value = '';

  void submit(context, request, key) async {
    var map = <String, String>{};
    map["name"] = _nameController.text;
    map["about"] = _aboutController.text;
    map["image_name"] = _value;
    await request.post("https://notedote.herokuapp.com/profile/submit-profile", map);
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<ScaffoldState>();
    final request = context.watch<CookieRequest>();
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
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
                              onTap: () => setState(
                                  () => _value = snapshot.data![0]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![0]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![0]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![1]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![1]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![1]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![2]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![2]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![2]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![3]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![3]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![3]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![4]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![4]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![4]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![5]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![5]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![5]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![6]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![6]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![6]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![7]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![7]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![7]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![8]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![8]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![8]['url']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _value = snapshot.data![9]['name']),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _value == snapshot.data![9]['name']
                                        ? Colors.grey
                                        : Colors.transparent,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(snapshot.data![9]['url']),
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
                        if (_nameController.text.isNotEmpty &&
                            _aboutController.text.isNotEmpty &&
                            _value.isNotEmpty) {
                          submit(context, request, _key);
                          Navigator.of(context)
                              .pushReplacementNamed(ProfileScreen.routeName);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  content: const Text('Form is not valid'),
                                  action: SnackBarAction(
                                    label: 'Hide',
                                    onPressed: () {},
                                  )));
                          _nameController.clear();
                          _aboutController.clear();
                        }
                      })),
            ])));
  }
}
