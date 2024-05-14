import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import '../crop_management/my_card.dart';
import '../rate_comment/comment_description_page.dart';
import '../rate_comment/rate_card.dart';

class RateComFarmPage extends StatefulWidget {
  const RateComFarmPage({super.key});

  @override
  State<RateComFarmPage> createState() => _RateComFarmPageState();
}

class _RateComFarmPageState extends State<RateComFarmPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (ctrl) {
          return RefreshIndicator(
            onRefresh: () async {
              ctrl.fetchRatesComment();
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffe1f6cb),
                title: Text('Rate and Comment Farmer'),
                // Add leading back button to navigate to HomePage
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/home_back.jpg', // Replace 'assets/background_image.jpg' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 400,
                    color: Colors.green[400],
                    child: Text(
                      '      List of farmers',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold // Adjust the font size as needed
                          ),
                    ),
                  ),
                  // Content on top of the background image
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 0),
                          child: TextFormField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(
                                  () {}); // Refresh the UI when the text changes
                            },
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                              contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Adjust the radius as needed
                              ),
                            ), // Adjust height as needed
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('farmer_users')
                                .where('name',
                                    isGreaterThanOrEqualTo:
                                        _searchController.text)
                                .where('name',
                                    isLessThan: _searchController.text + 'z')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              final List<DocumentSnapshot> documents =
                                  snapshot.data!.docs;
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        childAspectRatio: 2.2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8),
                                itemCount: documents.length,
                                itemBuilder: (context, index) {
                                  final Map<String, dynamic> data =
                                      documents[index].data()
                                          as Map<String, dynamic>;
                                  return RateCard(
                                    index: index,
                                    name: data['name'] ?? 'No name',
                                    imageUrl: data['imageUrl'] ?? 'url',
                                    rate: data['rate'] ?? 00,
                                    onTap: () {
                                      Get.to(
                                        const CommentDescriptionPage(),
                                        arguments: {'data': documents[index]},
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
