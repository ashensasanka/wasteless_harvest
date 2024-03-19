import 'package:flutter/material.dart';

class WhenHarvestingPage extends StatefulWidget {
  const WhenHarvestingPage({super.key});

  @override
  State<WhenHarvestingPage> createState() => _WhenHarvestingState();
}

class _WhenHarvestingState extends State<WhenHarvestingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Practice when harvesting'),
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
