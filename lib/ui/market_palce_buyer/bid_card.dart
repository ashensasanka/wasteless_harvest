

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';


class BidCard extends StatefulWidget {
  final int index;
  final String name;
  final String imageUrl;
  final String offerTag;
  final Function onTap;
  final String type;

  const BidCard(
      {super.key,
        required this.name,
        required this.imageUrl,
        required this.offerTag,
        required this.onTap, required this.index, required this.type});

  @override
  State<BidCard> createState() => _CartCardState();
}

class _CartCardState extends State<BidCard> {

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
            padding: const EdgeInsets.all(8.0),
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
                        height: 120,
                      ),
                    ),
                    const SizedBox(width: 10), // Add a SizedBox with the desired width between the Expanded widgets
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // set your desired color
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Type: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, // not bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.type}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal, // bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // set your desired color
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Name: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, // not bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal, // bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              'Farmer Rating',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20, // adjust the size as needed
                                  color: Colors.yellow, // change the color if desired
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20, // adjust the size as needed
                                  color: Colors.yellow, // change the color if desired
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20, // adjust the size as needed
                                  color: Colors.yellow, // change the color if desired
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20, // adjust the size as needed
                                  color: Colors.yellowAccent, // change the color if desired
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20, // adjust the size as needed
                                  color: Colors.grey, // change the color if desired
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // set your desired color
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Amount: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, // not bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '15 kg',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal, // bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // set your desired color
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Date: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, // not bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '14/02/2024',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal, // bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("farmer")
                                    .doc("aLfB0xeahWG4tWKZ5ibB")
                                    .snapshots(),
                                builder: (context, snapshot){
                                  if (snapshot.hasData){
                                    final userdata = snapshot.data!.data() as Map<String, dynamic>;
                                    return Column(
                                        children: [
                                          const SizedBox(height: 10,),
                                          // Text('Price: Rs.${userdata['Bid']}.00')
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black, // set your desired color
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Price: ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold, // not bold
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Rs.${userdata['Bid']}.00',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.normal, // bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]
                                    );
                                  }else if (snapshot.hasError){
                                    return Center(
                                      child: Text('Error${snapshot.error}'),
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                            ),
                            const SizedBox(height: 5,),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // set your desired color
                                ),
                                children: [
                                  TextSpan(
                                    text: 'No of Bids: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, // not bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '15',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal, // bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
