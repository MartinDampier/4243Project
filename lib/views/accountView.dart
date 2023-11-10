import 'package:flutter/material.dart';

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
              width: 200, // Set your desired width
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
              width: 200, // Set your desired width
              child: TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Enter your subject',
                  border: OutlineInputBorder(), // Add a border
                ),
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
                });
              },
              child: const Text('Modify'),
            ),
            if (_name.isNotEmpty && _subject.isNotEmpty)
              Text('Hello, $_name! Your subject is $_subject.'),
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
