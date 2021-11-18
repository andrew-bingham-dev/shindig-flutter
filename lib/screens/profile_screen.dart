import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shindig/models/user_model.dart';
import 'package:shindig/providers/firebase_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _canEdit = false;

  @override
  Widget build(BuildContext context) {
    UserModel _user = Provider.of<FirebaseProvider>(context).getUser;
    VoidCallback _logout = Provider.of<FirebaseProvider>(context).logout;

    void _toggleEditMode() {
      setState(() => _canEdit = !_canEdit);
    }

    void _discardChanges() {
      setState(() => _canEdit = false);
    }

    void _saveChanges() {}

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
          child: Expanded(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('UID')),
              initialValue: _user.uid,
              enabled: false,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Email')),
              initialValue: _user.email,
              enabled: _canEdit,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('First name')),
              initialValue: _user.firstName,
              enabled: _canEdit,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Last name')),
              initialValue: _user.lastName,
              enabled: _canEdit,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Date of birth')),
              initialValue: _user.dob,
              enabled: _canEdit,
            ),
            if (!_canEdit)
              ElevatedButton(
                onPressed: _toggleEditMode,
                child: const Text('Edit details'),
              ),
            if (_canEdit)
              ElevatedButton(
                onPressed: _toggleEditMode,
                child: const Text('Save changes'),
              ),
            if (_canEdit)
              ElevatedButton(
                onPressed: _discardChanges,
                child: const Text('Discard changes'),
              ),
            ElevatedButton(
              onPressed: _logout,
              child: const Text('Logout'),
            )
          ],
        ),
      )),
    );
  }
}
