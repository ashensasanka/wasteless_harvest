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
import '../home_screen/Eeducational_resources_page.dart';
import '../home_screen/crop_management_page.dart';
import '../home_screen/Feducational_resources_page.dart';
import '../home_screen/market_place_buyer_page.dart';
import '../home_screen/market_place_farmer_page.dart';
import '../home_screen/rate_comment_farmer_page.dart';
import '../home_screen/farmer_report_page.dart';
import 'onboarding_screen.dart';

class AexpertHomePage extends StatefulWidget {
  final String username;
  const AexpertHomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<AexpertHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<AexpertHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
            SizedBox(height: 40,width: double.infinity,),

                SizedBox(
                  height: 265,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EEducatResoPage(username: widget.username,),
                        ),
                      );
                    },
                    child: Container(
                      width: 265,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 42,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/eduresorce.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Educational Resources',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 23,
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
                SizedBox(height: 40,),
                SizedBox(
                  height: 265,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommForPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 265,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 53,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/community.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'Community Forum',
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
    );
  }
}

