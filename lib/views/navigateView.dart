import 'package:flutter/material.dart';

import '../enums/navigationTypes.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({Key? key, required this.title, required this.navType }) : super(key: key);
  final String title;
  final NavigationTypes navType;
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<NavigatePage> {
  AssetImage entrance = AssetImage('Assets/entrance1.jpg');
  AssetImage turnOne = AssetImage('Assets/TurnOne.jpg');
  AssetImage turnTwo = AssetImage('Assets/TurnTwo.jpg');
  AssetImage turnThree = AssetImage('Assets/TurnThree.jpg');
  AssetImage destination = AssetImage('Assets/Destination.jpg');
  String display = "Is this your entrance?";
  AssetImage displayImage = AssetImage('Assets/entrance1.jpg');
  Icon leftButton = Icon(Icons.cancel);
  Widget leftButtonAction = FloatingActionButton(onPressed: () {  },);
  Icon rightButton = Icon(Icons.check);
  Widget rightButtonAction = FloatingActionButton(onPressed: () {  },);
  int cound = 0;
  //final String assetName = 'assets/image_that_does_not_exist.svg';
  //final Widget svg = SvgPicture.asset(
  //  assetName,
  //);

 Widget back = FloatingActionButton(onPressed: () {  },);
 Widget cancel = FloatingActionButton(onPressed: () {  },);
 Widget cont = FloatingActionButton(onPressed: () {  },);
 Widget finish = FloatingActionButton(onPressed: () {  },);

 _SettingsPageState()
 {
   back = FloatingActionButton(onPressed: backImage, child: Icon(Icons.arrow_back),);
   cancel = FloatingActionButton(onPressed: leavePage, child: Icon(Icons.cancel),);
   cont = FloatingActionButton(onPressed: updateImage, child: Icon(Icons.check),);
   finish = FloatingActionButton(onPressed: leavePage, child: Icon(Icons.done_all),);
   leftButtonAction = cancel;
   rightButtonAction = cont;
 }
 void leavePage()
 {
   Navigator.pop(context);
 }
  void backImage() {
    setState(() {
      if(cound != 0)
        {
          cound--;
        }
      if(cound == 0)
      {
        displayImage = entrance;
        display = "Is this your entrance?";
        leftButton = Icon(Icons.cancel);
        leftButtonAction = cancel;
      }
      if(cound == 1)
      {
        leftButtonAction = back;
        displayImage = turnOne;
        display = "Move Down this hall";
        leftButton = Icon(Icons.arrow_back);
      }
      if(cound == 2)
      {
        displayImage = turnTwo;
      }
      if(cound == 3)
      {
        displayImage = turnThree;
        rightButtonAction = cont;
      }
      if(cound == 4)
      {
        displayImage = destination;
        display = "Welcome to class!";
        rightButtonAction = finish;
      }
    });
  }
  void updateImage() {
    setState(() {
      if(cound != 4)
        {
          cound++;
        }
      if(cound == 0)
        {
          displayImage = entrance;
          display = "Is this your entrance?";
          leftButton = Icon(Icons.cancel);
          leftButtonAction = cancel;
        }
      if(cound == 1)
        {
          displayImage = turnOne;
          display = "Move Down this hall";
          leftButton = Icon(Icons.arrow_back);
          leftButtonAction = back;
        }
      if(cound == 2)
        {
          displayImage = turnTwo;
        }
      if(cound == 3)
      {
        displayImage = turnThree;
        rightButtonAction = cont;
      }
      if(cound == 4)
      {
        displayImage = destination;
        display = "Welcome to class!";
        rightButtonAction = finish;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: displayImage,
        ),
        Text(
          display,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            leftButtonAction,
            SizedBox(width: 100,),
            rightButtonAction,

          ],
        ),

      ],
    ),
    ),
    );
  }
}