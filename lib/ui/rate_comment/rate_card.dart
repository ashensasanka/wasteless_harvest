import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import '../crop_management/edit_crop_page.dart';


class RateCard extends StatefulWidget {
  final int index;
  final String name;
  final String imageUrl;
  final int rate;
  final Function onTap;

  const RateCard(
      {super.key,
        required this.name,
        required this.imageUrl,
        required this.onTap,
        required this.index,
        required this.rate,});

  @override
  State<RateCard> createState() => _MyCardState();
}

class _MyCardState extends State<RateCard> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return InkWell(
        onTap: (){
          widget.onTap();
        },
        child: Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5,10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // or MainAxisAlignment.spaceBetween
                  children: [
                    Expanded(
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: 130,
                      ),
                    ),
                    const SizedBox(width: 10), // Add a SizedBox with the desired width between the Expanded widgets
                    Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 40,right: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8,),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Farmer Name: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text(
                                  'Farmer Rating: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (int i = 0; i < 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: i < widget.rate ? Colors.yellow : Colors.grey.withOpacity(0.5),
                                    size: 24,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
