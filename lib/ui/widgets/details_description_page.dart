import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<DescriptionPage> {

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = Get.arguments['data'] as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                data['imageurl'],
                fit: BoxFit.contain,
                width: 250,
                height: 180,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              // product.name ?? '',
              data['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Set your desired background color here
                borderRadius: BorderRadius.circular(10), // Set the desired radius here
              ),
              child: SizedBox(
                width: double.infinity, // Set your desired width here
                height: 400, // Set your desired height here
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Description about ${data['name']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(data['description'],
                        style: TextStyle(
                        fontSize: 16,
                      ),),
                    ],
                  ),
                ), // Replace 'data' with the widget you want to place inside SizedBox
              ),
            )
          ],
        ),
      ),
    );
  }
}
