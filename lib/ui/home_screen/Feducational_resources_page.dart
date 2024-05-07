import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/enrollers.dart';
import '../educational_resources/main/Earticles_page.dart';
import '../educational_resources/main/Farticles_page.dart';
import '../educational_resources/main/best_practices_page.dart';
import '../educational_resources/main/crop_types_page.dart';
import '../market_palce_buyer/bids_won_page.dart';
import '../market_palce_buyer/shop_page.dart';

class FEducatResoPage extends StatefulWidget {
  final String username;
  const FEducatResoPage({super.key, required this.username});

  @override
  State<FEducatResoPage> createState() => _FEducatResoPageState();
}

class _FEducatResoPageState extends State<FEducatResoPage> {
  bool isPremium = false; // Flag to track premium status

  @override
  void initState() {
    super.initState();
    // Call function to check premium status when the widget initializes
    checkPremiumStatus();
  }

  Future<void> checkPremiumStatus() async {
    // Retrieve the premium field value for the current user from Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('farmer_users').doc(widget.username).get();
    // Check if the premium field exists and if it's true
    if (userDoc.exists && userDoc.get('premium') == true) {
      setState(() {
        isPremium = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffe1f6cb),
        title: Text('Educational Resources'),
        // Add leading back button to navigate to HomePage
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            //CropTypesPage()
            Row(
              children: [
                SizedBox(width: 90,),
                //CropTypesPage()
                SizedBox(
                  height: 220,
                  child: GestureDetector(
                    onTap: () {
                      if (isPremium) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CropTypesPage(),
                          ),
                        );
                      } else {
                        // Show a message or handle the case when the user is not premium
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('You need to be a premium user to access this feature.'),
                        ));
                      }
                    },
                    child: Container(
                      width: 195,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/crop_info.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Crop Information',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 220,
              child: GestureDetector(
                onTap: () {
                  if (isPremium) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FArticlesPage(),
                      ),
                    );
                  } else {
                    // Show a message or handle the case when the user is not premium
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('You need to be a premium user to access this feature.'),
                    ));
                  }
                },
                child: Container(
                  width: 195,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                          child: Image.asset('assets/images/articles.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Articles',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 220,
              child: GestureDetector(
                onTap: () {
                  if (isPremium) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BestPracticePage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('You need to be a premium user to access this feature.'),
                    ));
                  }
                },
                child: Container(
                  width: 195,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/best_practice.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 19,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Best Practices',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
