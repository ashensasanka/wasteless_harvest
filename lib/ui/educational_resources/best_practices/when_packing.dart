import 'package:flutter/material.dart';

class WhenPackingPage extends StatefulWidget {
  const WhenPackingPage({super.key});

  @override
  State<WhenPackingPage> createState() => _WhenPackingState();
}

class _WhenPackingState extends State<WhenPackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Practice when packing'),
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
