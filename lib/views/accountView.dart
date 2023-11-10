import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  String _name = '';
  String _subject = '';
  String _gender = 'Walmart Bag'; // Default gender

  // Gender picker items
  final List<String> _genders = ['Male', 'Female', 'Walmart Bag'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Limit the size of the column
          children: <Widget>[
            Container(
              width: 200, // Set your desired width for text fields
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(), // Add a border
                ),
              ),
            ),
            SizedBox(height: 20), // Provide some vertical spacing
            Container(
              width: 200, // Set your desired width for text fields
              child: TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Enter your subject',
                  border: OutlineInputBorder(), // Add a border
                ),
              ),
            ),
            SizedBox(height: 20), // Provide some vertical spacing
            // Gender selection buttons
            for (var gender in _genders)
              Container(
                width: 200,
                color: _gender == gender ? Colors.yellow : Colors.transparent, // Highlight selected gender
                child: ListTile(
                  title: Text(
                    gender,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _gender == gender ? Colors.black : Colors.grey, // Change text color based on selection
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _gender = gender;
                    });
                  },
                ),
              ),
            SizedBox(height: 20), // Provide some vertical spacing
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
