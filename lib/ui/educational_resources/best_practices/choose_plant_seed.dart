import 'package:flutter/material.dart';

class ChoosePlantPage extends StatefulWidget {
  const ChoosePlantPage({super.key});

  @override
  State<ChoosePlantPage> createState() => _ChoosePlantPageState();
}

class _ChoosePlantPageState extends State<ChoosePlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choosing Plant and Seeds'),
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
