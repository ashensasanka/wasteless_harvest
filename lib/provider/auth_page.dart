import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/ui/screens/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/screens/enroller_page.dart';
import '../ui/screens/farmer_home_page.dart';
import '../ui/screens/lets_start_page.dart';
import '../ui/screens/onboarding_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            User? user = snapshot.data;
            if (user != null) {
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('expert_users').doc('Expert123').get(),
                builder: (context, documentSnapshot) {
                  if (documentSnapshot.hasData && documentSnapshot.data != null) {
                    String userRole = documentSnapshot.data!.get('uid');
                    return userRole == 'Expert' ? const EnrollerPage():const RootPage();
                  } else {
                    return const CircularProgressIndicator(); // Handle loading state
                  }
                },
              );
            }
          }
          // User is not logged in
          return const StartPage();
        },
      ),
    );
  }
}
