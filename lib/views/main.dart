import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/locationService.dart';
import 'package:flutter_application_1/styles/genericStyles.dart';
import 'package:flutter_application_1/views/accountView.dart';
import 'package:flutter_application_1/views/classesView.dart';
import 'package:flutter_application_1/views/settingsView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: genericStyles.purpleTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  LocationService locationService = new LocationService();

  Future<void> loadSettings() async {
    await locationService.GetLocation();
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
