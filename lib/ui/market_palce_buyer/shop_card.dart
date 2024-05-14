import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';

class ShopCard extends StatefulWidget {
  final int index;
  final String hbid;
  final String name;
  final String collName;
  final String alldocID;
  final String owndocID;
  final String imageUrl;
  final double price;
  final double amount;
  final String date;
  final Function onTap;
  final String type;

  ShopCard(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.date,
      required this.onTap,
      required this.index,
      required this.type,
      required this.amount,
      required this.alldocID,
      required this.collName,
      required this.owndocID, required this.hbid});

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  final allCollection = FirebaseFirestore.instance.collection("all_listings");


  Future<void> editField(String field) async {
    final ownCollection = FirebaseFirestore.instance.collection(widget.collName);
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit Bid",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new Bid",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
    if (newValue.trim().isNotEmpty) {
      await allCollection.doc(widget.alldocID).update(
        {
          field: double.tryParse(newValue),
        },
      );
      await ownCollection.doc(widget.owndocID).update(
        {
          'hbidname':widget.hbid,
          field: double.tryParse(newValue),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Card(
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
                    //Image
                    Expanded(
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: 140,
                      ),
                    ),
                    const SizedBox(
                        width:
                            5), // Add a SizedBox with the desired width between the Expanded widgets
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Type
                          Text(
                            'Type',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${widget.type}',
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Name
                          Text(
                            'Name',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${widget.name}',
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Farmer Rating
                          Text(
                            'Farmer Rating',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 20, // adjust the size as needed
                                color: Colors
                                    .yellow, // change the color if desired
                              ),
                              Icon(
                                Icons.star,
                                size: 20, // adjust the size as needed
                                color: Colors
                                    .yellow, // change the color if desired
                              ),
                              Icon(
                                Icons.star,
                                size: 20, // adjust the size as needed
                                color: Colors
                                    .yellow, // change the color if desired
                              ),
                              Icon(
                                Icons.star,
                                size: 20, // adjust the size as needed
                                color: Colors
                                    .yellowAccent, // change the color if desired
                              ),
                              Icon(
                                Icons.star,
                                size: 20, // adjust the size as needed
                                color:
                                    Colors.grey, // change the color if desired
                              ),
                            ],
                          ),
                          //Bid button
                          TextButton(
                            onPressed: () => editField('hbid'),
                            child: Text(
                              "Bid",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Amount
                              Text(
                                'Amount',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${widget.amount} kg',
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //Date
                              Text(
                                'Date',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                widget.date,
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //Current Price
                              Text(
                                'Current Price',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${widget.price}0',
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                              // StreamBuilder<DocumentSnapshot>(
                              //     stream: FirebaseFirestore.instance
                              //         .collection("farmer")
                              //         .doc("aLfB0xeahWG4tWKZ5ibB")
                              //         .snapshots(),
                              //     builder: (context, snapshot){
                              //       if (snapshot.hasData){
                              //         final userdata = snapshot.data!.data() as Map<String, dynamic>;
                              //         return Column(
                              //             children: [
                              //               const SizedBox(height: 10,),
                              //               Text('Rs: ${userdata['Bid']}.00')
                              //             ]
                              //         );
                              //       }else if (snapshot.hasError){
                              //         return Center(
                              //           child: Text('Error${snapshot.error}'),
                              //         );
                              //       }
                              //       return const Center(
                              //         child: CircularProgressIndicator(),
                              //       );
                              //     }
                              // )
                            ]))
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
