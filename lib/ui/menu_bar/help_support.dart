import 'package:flutter/material.dart';

class HelpSuppPage extends StatefulWidget {
  const HelpSuppPage({super.key});

  @override
  State<HelpSuppPage> createState() => _AppPreffPageState();
}

class _AppPreffPageState extends State<HelpSuppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe1f6cb),
        title: Text('Help and Support'),
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
                    'Welcome to the Help and Support section of our Farmer Mobile App! We\'re here to assist you with any questions or issues you may have regarding the apps features, usage, or any other concerns you might encounter. Below, you will find different ways to get the help you.',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '1. FAQ Section:',
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
                          'Our FAQ (Frequently Asked Questions) section contains answers to commonly encountered queries. You might find the solution to your question here without needing further assistance. You can access the FAQ section from the app\'s main menu.'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '2. In-App Tutorials:',
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
                          'Explore our in-app tutorials to learn how to use various features of the app effectively. These tutorials provide step-by-step guidance on tasks such as managing your profile, browsing products, making purchases, and more. To access the tutorials, navigate to the "Tutorials" section in the app\'s settings menu.'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '3. Live Chat Support:',
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
                          'If you require immediate assistance or have a specific query that\'s not covered in the FAQ or tutorials, you can chat with our support team in real-time. Simply tap on the "Live Chat" option in the app\'s settings menu to start a conversation with one of our support representatives. We\'re available to assist you during our business hours.'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '4. Email Support:',
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
                          'For non-urgent inquiries or feedback, you can reach out to our support team via email. Send your questions, suggestions, or concerns to support@example.com, and one of our team members will get back to you as soon as possible.'),
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
