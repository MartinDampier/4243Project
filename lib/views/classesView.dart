import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/genericStyles.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/models/class.dart';

class ClassesPage extends StatefulWidget {
  ClassesPage({Key? key, required this.title, required this.myUser}) : super(key: key);
  final String title;
  user myUser;

  @override
  _ClassesPageState createState() {
    var pageState = _ClassesPageState();
    pageState.User = myUser;
    pageState.SetUp();
    return _ClassesPageState();
  }
}

class _ClassesPageState extends State<ClassesPage> {
  List<String> inputTexts = [];
  List<StudentClass> classes = List.empty(growable: true);
  final TextEditingController textController = TextEditingController();
  user? User;

  void SetUp(){
    if(User != null)
      {
        for(var i = 0; i < User!.Classes.length; i++)
          {
            classes.add(User!.Classes[i]);
          }
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: genericStyles.lsuPurple, // Change this to your desired color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(7.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter class here',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
                final text = classes[index].name;
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      inputTexts.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red, // Background color when swiping
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      text!,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            final text = textController.text;
            if (text.isNotEmpty) {
              inputTexts.add(text);
              textController.clear();
            }
          });
        },
      ),
    );
  }
}
