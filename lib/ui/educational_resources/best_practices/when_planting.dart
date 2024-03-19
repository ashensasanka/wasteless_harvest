import 'package:flutter/material.dart';

class WhenPlantingPage extends StatefulWidget {
  const WhenPlantingPage({super.key});

  @override
  State<WhenPlantingPage> createState() => _WhenPlantingState();
}

class _WhenPlantingState extends State<WhenPlantingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Practice when planting'),
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
