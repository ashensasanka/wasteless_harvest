import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/ui/screens/root_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/enrollers.dart';
import '../crop_management/add_crops_page.dart';
import '../crop_management/my_crops_page.dart';
import '../market_palce_buyer/bids_won_page.dart';
import '../market_palce_buyer/shop_page.dart';
import '../screens/farmer_root_page.dart';
import '../screens/farmer_home_page.dart';

class BuyerMarketPlacePage extends StatefulWidget {
  final String username;
  const BuyerMarketPlacePage({super.key, required this.username});

  @override
  State<BuyerMarketPlacePage> createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<BuyerMarketPlacePage> {
  bool isPremium = false; // Flag to track premium status

  @override
  void initState() {
    super.initState();
    checkPremiumStatus();
  }

  Future<void> checkPremiumStatus() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('buyer_users')
        .doc('Buyer123')
        .get();
    if (userDoc.exists && userDoc.get('premium') == true) {
      setState(
        () {
          isPremium = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe1f6cb),
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
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                SizedBox(
                  height: size.height * .3,
                  child: GestureDetector(
                    onTap: () {
                      if (isPremium) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopPage(username: widget.username,),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'You need to be a premium user to access this feature.'),
                          ),
                        );
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
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/shop.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Shop',
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
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: size.height * .3,
              child: GestureDetector(
                onTap: () {
                  // Navigate to MyListingPage only if the user is premium
                  if (isPremium) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BidsWonPage(),
                      ),
                    );
                  } else {
                    // Show a message or handle the case when the user is not premium
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'You need to be a premium user to access this feature.'),
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
                        bottom: 55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius according to your preference
                          child: Image.asset('assets/images/won_bid.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Won Bid',
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
                    color: Color(0xff73B633),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
