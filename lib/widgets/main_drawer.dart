import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../screens/weekly_schedule.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Notedote',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Dashboard', Icons.house, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Personal Journal', Icons.laptop, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Notes', Icons.folder, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Quotes', Icons.text_fields, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Weekly Schedule', Icons.calendar_today, () {
            Navigator.of(context).pushReplacementNamed(WeeklySchedule.routeName);
          }),
          buildListTile('Profile', Icons.person, () {
            Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
          }),
        ],
      ),
    );
  }
}
