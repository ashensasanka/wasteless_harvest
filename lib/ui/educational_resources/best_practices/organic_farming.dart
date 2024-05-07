import 'package:flutter/material.dart';

class OrganicPage extends StatefulWidget {
  const OrganicPage({super.key});

  @override
  State<OrganicPage> createState() => _OrganicPageState();
}

class _OrganicPageState extends State<OrganicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organic Farming'),
        // Add leading back button to navigate to HomePage
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
