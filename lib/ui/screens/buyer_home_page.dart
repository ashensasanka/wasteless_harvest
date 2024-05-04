import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/ui/home_screen/community_forum_page.dart';
import 'package:farmer/ui/screens/signin_buyer_page.dart';
import 'package:farmer/ui/screens/signin_farmer_page.dart';
import 'package:farmer/ui/screens/signing_aexpert_page.dart';
import 'package:flutter/material.dart';
import 'package:farmer/constants/constants.dart';
import 'package:farmer/models/plants.dart';
import 'package:farmer/ui/screens/detail_page.dart';
import 'package:farmer/ui/widgets/plant_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../models/enrollers.dart';
import '../../models/home_details.dart';
import '../../provider/auth_provider.dart';
import '../home_screen/buyer_report_page.dart';
import '../home_screen/crop_management_page.dart';
import '../home_screen/Feducational_resources_page.dart';
import '../home_screen/market_place_buyer_page.dart';
import '../home_screen/market_place_farmer_page.dart';
import '../home_screen/rate_comment_farmer_page.dart';
import '../home_screen/farmer_report_page.dart';
import '../payment_screen/buyer_payment_page.dart';
import '../payment_screen/farmer_payment_page.dart';
import 'onboarding_screen.dart';

class BuyerHomePage extends StatefulWidget {
  final String username;
  const BuyerHomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<BuyerHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<BuyerHomePage> {
  bool isPremium = false; // Flag to track premium status

  @override
  void initState() {
    super.initState();
    // Call function to check premium status when the widget initializes
    checkPremiumStatus();
  }

  Future<void> checkPremiumStatus() async {
    // Retrieve the premium field value for the current user from Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('buyer_users').doc(widget.username).get();
    // Check if the premium field exists and if it's true
    if (userDoc.exists && userDoc.get('premium') == true) {
      setState(() {
        isPremium = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    List<HomeDetails> homeDetails = HomeDetails.homeDetails;

    return RefreshIndicator(
      onRefresh:()async{
        checkPremiumStatus();
      },
      child: Scaffold(
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
              SizedBox(height: 60,),
              Row(
                children: [
                  SizedBox(width: 25,),
                  SizedBox(
                    height: 175,
                    child: GestureDetector(
                      onTap: () {
                        if (isPremium) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuyerMarketPlacePage(),
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
                        width: 160,
                        margin: EdgeInsets.symmetric(horizontal: 10), // Adjust the left margin
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              right: 10,
                              bottom: 45,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('assets/images/market.jpg'),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 17,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Market Place",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
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
                    height: 175,
                    child: GestureDetector(
                      onTap: () {
                        if (isPremium) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommForPage(),
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
                        width: 160,
                        margin: EdgeInsets.symmetric(horizontal: 10), // Adjust the right margin
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              right: 10,
                              bottom: 53,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('assets/images/community.jpg'),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Community\nForum',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 19,
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
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 25,),
                  SizedBox(
                    height: 175,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to MyListingPage only if the user is premium
                        if (isPremium) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RateComFarmPage(),
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
                        width: 160,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              right: 10,
                              bottom: 47,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                                child: Image.asset('assets/images/rateandcomment.jpg'),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Rate & Comment\nFarmers',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
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
                  SizedBox(
                    height: 175,
                    child: GestureDetector(
                      onTap: () {
                        if (isPremium) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuyerReportPage(),
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
                        width: 160,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              right: 10,
                              bottom: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                                child: Image.asset('assets/images/report.jpg'),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Reports',
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
                          color: Color(0xff73B633),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 175,
                child: isPremium? SizedBox():GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BPaymentPage(userName: widget.username,),
                        ),
                      );
                  },
                  child: Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 42,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                            child: Image.asset('assets/images/payment.jpg'),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Subscribe',
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
                      color: Color(0xff73B633),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

