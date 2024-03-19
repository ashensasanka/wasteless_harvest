import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import 'edit_crop_page.dart';

class EditCard extends StatefulWidget {
  final String imageUrl;

  const EditCard(
      {super.key,
      required this.imageUrl,});

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  final userCollection = FirebaseFirestore.instance.collection("farmer");

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // or MainAxisAlignment.spaceBetween
                    children: [
                      Expanded(
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                          height: 130,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}
