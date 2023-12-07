import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/views/classesView.dart';
import 'package:flutter_application_1/enums/genders.dart';

import '../models/user.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  File? userConfig;
  String _name = '';
  String _subject = '';
  String _gender = 'Other'; // Default gender

  // Gender picker items
  final List<String> _genders = genders.values.map((x) => x.name).toList();

  //pick image
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path); // Update the state to display the new image.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(5),
          children: <Widget>[
            if (_imageFile != null)
              Center( // Center widget can be used to prevent horizontal stretching in ListView
                child: ClipOval(
                  child: Container(
                    width: 200, // Set this to the desired width of your image.
                    height: 200, // Set this to the desired height of your image.
                    child: Image.file(
                      _imageFile!,
                      fit: BoxFit.cover, // This will cover the area of the view without changing the aspect ratio of the image.
                    ),
                  ),
                ),
              )
            else
              CircleAvatar(
                child: Icon(Icons.person),
                radius: 100,
              ),

            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200, // Adjust the button width here
                child: ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Upload Avatar'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust button size here
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Use Align to center the children and Container to constrain the width
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                child: TextField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    labelText: 'Enter your subject',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ..._genders.map((gender) => Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                color: _gender == gender ? Colors.yellow : Colors.transparent,
                child: ListTile(
                  title: Text(
                    gender,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _gender == gender ? Colors.black : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _gender = gender;
                    });
                  },
                ),
              ),
            )),
            SizedBox(height: 10), // Provide some vertical spacing
            TextButton(
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                  _subject = _subjectController.text;
                });
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _nameController.text = '';
                  _subjectController.text = '';
                  _name = '';
                  _subject = '';
                  _gender = 'Walmart Bag'; // Reset the gender to default
                });
              },
              child: const Text('Modify'),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    // Use Navigator.push to navigate to the ClassesPage
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ClassesPage(title: 'My Classes', myUser: user(),);
                    }));
                  },
                  child: const Text('Next, put the class schedule'),
                ),
              ),
            ),
            if (_name.isNotEmpty && _subject.isNotEmpty && _gender.isNotEmpty)
              Text('Hello, $_name! Your subject is $_subject and your gender is $_gender.'),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),

            ),
          ],
        ),
      ),
    );
  }
}