
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/class.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/styles/genericStyles.dart';
import 'package:flutter_application_1/views/accountView.dart';
import 'package:flutter_application_1/views/classesView.dart';
import 'package:flutter_application_1/views/settingsView.dart';
import 'package:flutter_application_1/views/mapView.dart';
import 'package:flutter_application_1/enums/genders.dart';
import '../enums/navigationTypes.dart';
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
      home: const MyHomePage(title: 'Welcome to Class Finder!'),
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
  user myUser = user();

  _MyHomePageState(){
    myUser.Gender = genders.NonBinary;
    myUser.UserName = "DemoUser";
    myUser.Email = "DemoUser@Sage.com";
    myUser.PhoneNumber = "1234567890";
    myUser.BirthDate = DateTime(2000,1,1);
    myUser.MainSubject = "CSC";
    myUser.Classes.add(StudentClass(
        "CSC3304",
        "1225",
        TimeOfDay(hour: 7, minute: 30),
        TimeOfDay(hour: 8, minute: 20)
    ));
    myUser.Classes.add(StudentClass(
        "CSC4330",
        "1253",
        TimeOfDay(hour: 8, minute: 30),
        TimeOfDay(hour: 9, minute: 20)
    ));
    myUser.Classes.add(StudentClass(
        "CSC4598",
        "1300",
        TimeOfDay(hour: 9, minute: 30),
        TimeOfDay(hour: 10, minute: 30)
    ));
  }

  // [COMMANDS]
  void findNextClass() {
      TimeOfDay now = TimeOfDay.now();
      double nowComparable = now.hour + now.minute/60.0;
      List<StudentClass> futureClasses = myUser.Classes.where((z) => z.comparableStartTime! < nowComparable).toList();
      var nowClass = futureClasses.first;
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const NavigatePage(title: '', navType: NavigationTypes.NextClass,);
      }));
    });
  }
  void openMapView() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MapPage(title: 'Map');
      }));
    });
  }
  void searchForAClass()
  {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const NavigatePage(title: '', navType: NavigationTypes.Browse,);
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xfecf23),
                    Color(0x4f4f4f)
                  ],
                tileMode: TileMode.mirror
              )
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child:
              Image(
                image: AssetImage('Assets/Sage Logo.png'),
              ),
            ),
          ),
        ],
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
              ListTile(
                title: const Text('Map'),
                selected: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MapPage(title: 'Map');
                  }));
                },
              ),
            ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: findNextClass, icon: Icon(Icons.search)), // Find a class
            IconButton(onPressed: openMapView, icon: Icon(Icons.map)), //PFT MAP
            IconButton(onPressed: findNextClass, icon: Icon(Icons.directions_run)),
          ],
        )
      ),
    );
  }
}
