import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import 'edit_crop_page.dart';


class MyCard extends StatefulWidget {
  final int index;
  final String type;
  final String name;
  final String imageUrl;
  final Function onTap;
  final String plant_date;
  final String harvest_date;

  const MyCard(
      {super.key,
        required this.name,
        required this.imageUrl,
        required this.onTap,
        required this.index,
        required this.type,
        required this.plant_date,
        required this.harvest_date});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {

  final userCollection = FirebaseFirestore.instance.collection("farmer");


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
            padding: const EdgeInsets.fromLTRB(5,10, 0, 0),
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
                        height: 110,
                      ),
                    ),
                    const SizedBox(width: 10), // Add a SizedBox with the desired width between the Expanded widgets
                    Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 30,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Type: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.type}',
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
                            const SizedBox(height: 8,),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Name: ',
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
                            const SizedBox(height: 8,),
                            Text(
                              'Planted Date:',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${widget.plant_date}',
                              style: const TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              'Harvest Date:',
                              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${widget.harvest_date}',
                              style: const TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 90),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>  EditCropPage(
                                            index:widget.index,
                                            plant_date:widget.plant_date,
                                        harvest_date:widget.harvest_date),
                                      ),
                                    );
                                  } ,
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                ctrl.deleteProduct(ctrl.crops[widget.index].id ?? '');
                              },
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
