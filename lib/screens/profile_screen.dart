import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';
import '../cookie_request.dart';
import 'profile_edit_screen.dart';


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
