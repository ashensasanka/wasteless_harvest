import 'package:flutter/material.dart';

class PulsesPage extends StatefulWidget {
  const PulsesPage({super.key});

  @override
  State<PulsesPage> createState() => _PulsesPageState();
}

class _PulsesPageState extends State<PulsesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pulses and Cereals'),
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
