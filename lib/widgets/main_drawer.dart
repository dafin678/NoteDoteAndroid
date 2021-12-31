import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/screens/notes.dart';
import 'package:projek_akhir_f07/screens/motivasi.dart';
import '../screens/profile_screen.dart';
import '../screens/weekly_schedule.dart';
import '../screens/task_screen.dart';

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
            color: Theme.of(context).colorScheme.secondaryVariant,
            child: Text(
              'NOTEDOTE',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Dashboard', Icons.house, () {
            Navigator.of(context).pushReplacementNamed(Task.routeName);
          }),
          buildListTile('Personal Journal', Icons.laptop, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Notes', Icons.folder, () {
            Navigator.of(context).pushReplacementNamed(NoteHome.routeName);
          }),
          buildListTile('Quotes', Icons.text_fields, () {
            Navigator.of(context).pushReplacementNamed(Motivasisc.routeName);
          }),
          buildListTile('Weekly Schedule', Icons.calendar_today, () {
            Navigator.of(context)
                .pushReplacementNamed(WeeklySchedules.routeName);
          }),
          buildListTile('Profile', Icons.person, () {
            Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
          }),
        ],
      ),
    );
  }
}
