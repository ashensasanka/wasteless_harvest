import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';

class ListCard extends StatefulWidget {
  final int index;
  final String type;
  final String name;
  final String hbidname;
  final String imageUrl;
  final double amount;
  final double hbid;
  final Function onTap;
  final String date;


  const ListCard({super.key,
    required this.index,
    required this.type,
    required this.name,
    required this.hbidname,
    required this.imageUrl,
    required this.amount,
    required this.hbid,
    required this.onTap,
    required this.date});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String trimmedDate = DateTime(currentDate.year, currentDate.month, currentDate.day).toString();
    String result = trimmedDate.split(' ')[0];
    print(result);
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
                        height: 130,
                      ),
                    ),
                    const SizedBox(width: 5), // Add a SizedBox with the desired width between the Expanded widgets
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 0,right:2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Type: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${widget.type}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    'Name: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${widget.name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15,),
                              Column(
                                children: [
                                  Text(
                                    'Amount(Kg): ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${widget.amount}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    'Date: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.date,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rs: ${widget.hbid} ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 12,),
                          Text(
                            'Highest bidder name: ${widget.hbidname}',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
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
