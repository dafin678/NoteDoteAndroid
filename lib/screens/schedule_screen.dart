import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class MondayScreen extends StatefulWidget {
  static const routeName = '/monday-screen';

  const MondayScreen ({Key? key}) : super(key: key);

  @override
  _MondayScreen createState() => _MondayScreen();
}

class _MondayScreen extends State<MondayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

}

class TuesdayScreen extends StatefulWidget {
  static const routeName = '/tuesday-screen';

  const TuesdayScreen ({Key? key}) : super(key: key);

  @override
  _TuesdayScreen createState() => _TuesdayScreen();
}

class _TuesdayScreen extends State<TuesdayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuesday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

}

class WednesdayScreen extends StatefulWidget {
  static const routeName = '/wednesday-screen';

  const WednesdayScreen ({Key? key}) : super(key: key);

  @override
  _WednesdayScreen createState() => _WednesdayScreen();
}

class _WednesdayScreen extends State<WednesdayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wednesday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

}

class ThursdayScreen extends StatefulWidget {
  static const routeName = '/thursday-screen';

  const ThursdayScreen ({Key? key}) : super(key: key);

  @override
  _ThursdayScreen createState() => _ThursdayScreen();
}

class _ThursdayScreen extends State<ThursdayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thursday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

}

class FridayScreen extends StatefulWidget {
  static const routeName = '/friday-screen';

  const FridayScreen ({Key? key}) : super(key: key);

  @override
  _FridayScreen createState() => _FridayScreen();
}

class _FridayScreen extends State<FridayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

}

class SaturdayScreen extends StatefulWidget {
  static const routeName = '/saturday-screen';

  const SaturdayScreen ({Key? key}) : super(key: key);

  @override
  _SaturdayScreen createState() => _SaturdayScreen();
}

class _SaturdayScreen extends State<SaturdayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saturday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

}

class SundayScreen extends StatefulWidget {
  static const routeName = '/sunday-screen';

  const SundayScreen ({Key? key}) : super(key: key);

  @override
  _SundayScreen createState() => _SundayScreen();
}

class _SundayScreen extends State<SundayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

}