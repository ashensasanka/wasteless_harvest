import 'package:flutter/material.dart';

class PaddyPage extends StatefulWidget {
  const PaddyPage({super.key});

  @override
  State<PaddyPage> createState() => _PaddyPageState();
}

class _PaddyPageState extends State<PaddyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paddy'),
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
