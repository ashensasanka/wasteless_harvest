import 'package:flutter/material.dart';

class TermsConditionPage extends StatefulWidget {
  const TermsConditionPage({super.key});

  @override
  State<TermsConditionPage> createState() => _AppPreffPageState();
}

class _AppPreffPageState extends State<TermsConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe1f6cb),
        title: Text('Terms and Privacy Policy'),
        // Add leading back button to navigate to HomePage
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    'Welcome to WASTELESS HARVEST! \nBy downloading, accessing, or using WASTELESS HARVEST, you agree to comply with and be bound by the following terms and conditions of use. Please read these terms carefully before using the app. If you do not agree to these terms, you may not use the app.',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '1. Use of the App:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Container(
                      height: 70,
                      width: 350,
                      child: Text(
                          'WASTELESS HARVEST is designed to provide crop management.You agree to use the app only for lawful purposes and in accordance with these terms.'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '2. Intellectual Property:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Container(
                      height: 100,
                      width: 350,
                      child: Text(
                          'All content, features, and functionality of the app, including but not limited to trademarks, logos, text, images, graphics, and software, are the property of WASTELESS HARVEST and are protected by copyright, trademark, and other intellectual property laws.'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '3. User Accounts:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Container(
                      height: 100,
                      width: 350,
                      child: Text(
                          'In order to access certain features of the app, you may be required to create a user account.\nYou are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '4. Governing Law:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Container(
                      height: 100,
                      width: 350,
                      child: Text(
                          'These terms shall be governed by and construed in accordance with the laws of Sri Lanka.'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
