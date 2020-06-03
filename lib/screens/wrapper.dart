import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:facebookclone/screens/feeds/feeds.dart';
import 'package:facebookclone/screens/auth_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    if (user == null) {
      return AuthPage();
    } else {
      return Feeds();
    }
  }
}
