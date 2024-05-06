import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

import '../../constants/constants.dart';
import '../crop_management/my_listing_farmer.dart';
import '../market_palce_buyer/bids_won_page.dart';
import '../market_palce_buyer/shop_page.dart';
import '../market_place_farmer/create_new_listing.dart';

class FarmerMarketPlacePage extends StatefulWidget {
  final String username;
  const FarmerMarketPlacePage({Key? key, required this.username}) : super(key: key);

  @override
  State<FarmerMarketPlacePage> createState() => _FarmerMarketPlacePageState();
}

class _FarmerMarketPlacePageState extends State<FarmerMarketPlacePage> {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffe1f6cb),
        title: Text('Market Place'),
        // Add leading back button to navigate to the HomePage
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
            SizedBox(height: 40,),
            //MyListingPage()
            Row(
              children: [
                SizedBox(width: 80,),
                SizedBox(
                  height: size.height * .3,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to MyListingPage only if the user is premium
                      if (isPremium) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyListingPage(username: widget.username,),
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
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/shop.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 19,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'My Listings',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 30,
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
            SizedBox(height: 50,),
            //FarmerAddListing()
            Row(
              children: [
                SizedBox(width: 80,),
                SizedBox(
                  height: size.height * .3,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to MyListingPage only if the user is premium
                      if (isPremium) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FarmerAddListing(username: widget.username,),
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
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/won_bid.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Create \nNew Listings',
                                  textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );

  }
}
