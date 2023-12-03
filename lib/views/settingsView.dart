import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _username = 'Team SAGE'; // Default username
  String _email = 'user123@example.com'; // Default email
  DateTime _birthdate = DateTime(1990, 1, 1); // Default birthdate
  String _phoneNumber = '+1234567890'; // Default phone number


  Future<void> _changeUsername() async {
    String? newUsername = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController usernameController = TextEditingController();
        return AlertDialog(
          title: const Text('Change Username'),
          content: TextField(
            controller: usernameController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'New username'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context); // Dismiss the dialog without changing the username
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.pop(context, usernameController.text); // Return the new username and update state
              },
            ),
          ],
        );
      },
    );

    if (newUsername != null && newUsername.isNotEmpty) {
      setState(() {
        _username = newUsername; // Update the username with the new value
      });
    }
  }

  Future<void> _changeEmail() async {
    String? newEmail = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController emailController = TextEditingController();
        return AlertDialog(
          title: const Text('Change Email'),
          content: TextField(
            controller: emailController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'New email'),
            keyboardType: TextInputType.emailAddress,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context); // Dismiss the dialog without changing the email
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                if (EmailValidator.validate(emailController.text)) {
                  Navigator.pop(context, emailController.text); // Return the new email and update state
                } else {
                  // Show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid email format. Please try again.')),
                  );
                }
              },
            ),
          ],
        );
      },
    );

    if (newEmail != null && EmailValidator.validate(newEmail)) {
      setState(() {
        _email = newEmail; // Update the email with the new value
      });
    }
  }

  Future<void> _changeBirthdate() async {
    DateTime? newBirthdate = await showDatePicker(
      context: context,
      initialDate: _birthdate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (newBirthdate != null) {
      setState(() {
        _birthdate = newBirthdate;
      });
    }
  }

  Future<void> _changePhoneNumber() async {
    String newPhoneNumber = _phoneNumber; // Initialize with the current phone number

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Phone Number'),
          content: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              newPhoneNumber = number.phoneNumber ?? ''; // Update with the new input
            },
            initialValue: PhoneNumber(isoCode: 'US', phoneNumber: _phoneNumber),
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),
            formatInput: false,
            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
            inputDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone Number',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      },
    );

    if (newPhoneNumber.isNotEmpty && newPhoneNumber != _phoneNumber) {
      setState(() {
        _phoneNumber = newPhoneNumber; // Update the phone number with the new value
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Username'),
            subtitle: Text(_username),
            onTap: _changeUsername,
          ),
          ListTile(
            title: const Text('Email'),
            subtitle: Text(_email),
            onTap: _changeEmail,
          ),
          ListTile(
            title: const Text('Phone Number'),
            subtitle: Text(_phoneNumber),
            onTap: _changePhoneNumber,
          ),

          ListTile(
            title: const Text('Birthdate'),
            subtitle: Text(DateFormat('yMMMMd').format(_birthdate)), // Using the intl package to format the date
            onTap: _changeBirthdate,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context); // This will take you back to the previous screen
              },
              child: const Text('Go Back'),
            ),
          ),
        ],
      ),
    );
  }
}