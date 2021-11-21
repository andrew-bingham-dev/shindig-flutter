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
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();

  bool _canEdit = false;
  bool _hasBeenModified = false;

  @override
  Widget build(BuildContext context) {
    UserModel _user = Provider.of<FirebaseProvider>(context).getUser;
    VoidCallback _logout = Provider.of<FirebaseProvider>(context).logout;
    final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();

    void _resetForm() {
      _emailTEC.text = _user.email ?? '';
      _firstNameTEC.text = _user.firstName ?? '';
      _lastNameTEC.text = _user.lastName ?? '';
    }

    void _toggleEditMode() {
      setState(() => _canEdit = !_canEdit);
    }

    void _discardChanges() {
      _resetForm();
      setState(() => _canEdit = false);
    }

    void _saveChanges() async {
      final _wasSuccessful =
          await Provider.of<FirebaseProvider>(context, listen: false)
              .updateUserProfile(
                  email: _emailTEC.text,
                  firstName: _firstNameTEC.text,
                  lastName: _lastNameTEC.text);
      if (_wasSuccessful) {
        setState(() {
          _canEdit = false;
          _hasBeenModified = false;
        });
        print('Successfully updated profile details');
      } else {
        print('Failed to update profile details');
      }
    }

    _resetForm();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
          key: _profileFormKey,
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
                  controller: _emailTEC,
                  enabled: _canEdit,
                  onChanged: (_) => _hasBeenModified == true,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text('First name')),
                  controller: _firstNameTEC,
                  enabled: _canEdit,
                  validator: (String? value) {
                    if (value == null || value.length < 2) {
                      return 'You must enter at least 2 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Last name')),
                  controller: _lastNameTEC,
                  enabled: _canEdit,
                  validator: (String? value) {
                    if (value == null || value.length < 2) {
                      return 'You must enter at least 2 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text('Date of birth')),
                  initialValue: _user.dob,
                ),
                if (!_canEdit)
                  ElevatedButton(
                    onPressed: _toggleEditMode,
                    child: const Text('Edit details'),
                  ),
                if (_canEdit)
                  ElevatedButton(
                    onPressed: _saveChanges,
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
