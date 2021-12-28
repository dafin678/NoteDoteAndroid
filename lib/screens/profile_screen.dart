import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';
import '../cookie_request.dart';


class ProfileEditScreen extends StatefulWidget {
  static const routeName = '/edit-profile';
  const ProfileEditScreen({Key? key}) : super(key: key);
  @override
  _ProfileEditScreen createState() => _ProfileEditScreen();
}

class _ProfileEditScreen extends State<ProfileEditScreen> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => setState(() => _value = 0),
              child: Container(
                height: 56,
                width: 56,
                color: _value == 0 ? Colors.grey : Colors.transparent,
                child: const Icon(Icons.call),
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => setState(() => _value = 1),
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: _value == 1 ? Colors.grey : Colors.transparent,
                  width: 5,
                )),
                child: const Icon(Icons.message),
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => setState(() => _value = 2),
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: _value == 2 ? Colors.grey : Colors.transparent,
                  width: 5,
                )),
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var name = '';
  var about = '';
  var imgUrl = '';
  void getProfile(request) async {
    final response = await request.get("https://notedote.herokuapp.com/profile/get-profile");
    setState(() {
    name = response['name'];
    about = response['about'];
    imgUrl = response['imageUrl'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    getProfile(request);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(ProfileEditScreen.routeName);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.network(imgUrl),
            Padding(
                padding: const EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 0.0),
                child: Text(name,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 60),
                ),
              ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('About Me'),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 0.0),
                child: Text(about,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
