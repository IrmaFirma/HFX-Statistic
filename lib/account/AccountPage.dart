import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/Components/Avatar.dart';
import 'package:time_tracker/Components/PlatformAwareDialog.dart';
import 'package:time_tracker/Screens/WelcomeScreen.dart';
import 'package:time_tracker/Services/auth.dart';

class AccountPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
      Navigator.of(context)
          .push(MaterialPageRoute<void>(builder: (context) => WelcomeScreen()));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAwareDialog(
      title: 'Logout',
      content: 'Are you sure that you want to Logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFF1F232E),
      appBar: AppBar(
        title: Text('Account',  style: TextStyle(color: Color(0xFFC6D5E9))),
        backgroundColor: Color(0xFF2A3040),
        leading: Container(),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFC6D5E9),
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: _buildUserInfo(auth.currentUser),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: [
        Avatar(
          photoURL: user.photoURL,
          radius: 50
        ),
        SizedBox(height: 2),
        if(user.displayName != null)
          Text(
            user.displayName,
            style: TextStyle(color: Colors.white54),
          ),
        SizedBox(height: 2),
      ],
    );
  }
}
