import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/ui/rate_comment/comments_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/text_box.dart';
import '../../constants/app_colors.dart';
import '../../controller/home_controller.dart';
import '../../model/rate_comment/rate_comment.dart';

class CommentDescriptionPage extends StatefulWidget {
  const CommentDescriptionPage({super.key});

  @override
  State<CommentDescriptionPage> createState() => _CommentDescriptionPageState();
}

class _CommentDescriptionPageState extends State<CommentDescriptionPage> {
  List<bool> starPressedState = [false, false, false, false, false];
  void updateStarColors(int index) {
    setState(() {
      for (int i = 0; i <= index; i++) {
        starPressedState[i] = true;
      }
      for (int i = index + 1; i < starPressedState.length; i++) {
        starPressedState[i] = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = Get.arguments['data'].data() as Map<String, dynamic>;
    // RateComment rateComment = Get.arguments['data'];
    // double rate = rateComment.rate as double;
    // double rate = data['rate'] as double;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate and Comment Farmer', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data['imageUrl'] ?? 'url',
                fit: BoxFit.contain,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: data['name'] ?? 'No name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 55,),
                Column(
                  children: [
                    Text(
                      'Farmer Rating: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: i < data['rate'] ? Colors.yellow : Colors.grey.withOpacity(0.5),
                            size: 20,
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Owned crops:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Orders closed:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Orders pending:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text('5',
                      style: TextStyle(
                          fontSize: 15,
                      ),),
                    Text('5',
                      style: TextStyle(
                        fontSize: 15,
                      ),),
                    Text('5',
                      style: TextStyle(
                        fontSize: 15,
                      ),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey[300],
              width: 550,
              child: Text(
                  'Add your Comment'
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.radio_button_checked_outlined),
                    SizedBox(width: 20,),
                    Text(data['username']),
                    // StreamBuilder<DocumentSnapshot>(
                    //     stream: FirebaseFirestore.instance
                    //         .collection("farmer_users")
                    //         .doc("Farmer1")
                    //         .snapshots(),
                    //     builder: (context, snapshot){
                    //       if (snapshot.hasData){
                    //         final userdata = snapshot.data!.data() as Map<String, dynamic>;
                    //
                    //         return ;
                    //       } else if (snapshot.hasError){
                    //         return Center(
                    //           child: Text('Error${snapshot.error}'),
                    //         );
                    //       }
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    // ),
                  ],
                ),
                SizedBox(width: 90,),
                Row(
                  children: [
                    Text('Rate:'),
                    for (int i = 0; i < starPressedState.length; i++)
                      GestureDetector(
                        onTap: () {
                          updateStarColors(i);
                        },
                        child: Icon(
                          Icons.star,
                          color: starPressedState[i] ? Colors.yellow : Colors.grey.withOpacity(0.5),
                          size: 24,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            _buildMessageInput(),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey[300],
              width: 550,
              child: Text(
                  'Comments'
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.grey[100],
              width: 500,
              height: 200,
                child: CommentList(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMessageInput() {
    return GetBuilder<HomeController>(builder: (ctrl){
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [            // Text Field
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.messengerGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: ctrl.user1commeController,
                  decoration: const InputDecoration(
                    hintText: 'Aa',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                ctrl.add1CommentRate();
                // ctrl.fetchMessage();
                ctrl.user1commeController.clear();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green[200]!), // Change the color here
              ),
              child: Text(
                'Send',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      );
    });
  }
}
