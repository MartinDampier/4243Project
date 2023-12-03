import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/genericStyles.dart';
import 'package:flutter_application_1/views/accountView.dart';
import 'package:flutter_application_1/views/classesView.dart';
import 'package:flutter_application_1/views/settingsView.dart';

import 'navigateView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Finder',
      theme: genericStyles.purpleTheme,
      home: const MyHomePage(title: 'Class Finder Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void findNextClass() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const NavigatePage(title: '');
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Class Finder!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image(
              image: AssetImage('Assets/Sage Logo.png'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:
            [
              SizedBox(
                height: 60,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: genericStyles.lsuPurple,
                    ),
                    child: Text('Drawer Header'),
                  )
              ),
              ListTile(
                title: const Text('Account'),
                selected: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AccountPage(title: 'My Account');
                  }));
                },
              ),
              ListTile(
                title: const Text('Classes'),
                selected: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ClassesPage(title: 'My Classes');
                  }));
                },
              ),
              ListTile(
                title: const Text('Settings'),
                selected: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SettingsPage(title: 'Settings');
                  }));
                },
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: findNextClass,
        tooltip: 'Find your next class',
        child: const Icon(Icons.directions_run),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
