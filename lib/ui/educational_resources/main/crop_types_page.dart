import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/home_details.dart';
import '../../home_screen/community_forum_page.dart';
import '../../home_screen/crop_management_page.dart';
import '../../home_screen/Feducational_resources_page.dart';
import '../../home_screen/market_place_buyer_page.dart';
import '../../home_screen/rate_comment_farmer_page.dart';
import '../../home_screen/farmer_report_page.dart';
import '../crop_information/fruit_information.dart';
import '../crop_information/paddy_information.dart';
import '../crop_information/pulses_information.dart';
import '../crop_information/vegetables_information.dart';
import '../crop_information/yams_information.dart';

class CropTypesPage extends StatefulWidget {
  const CropTypesPage({super.key});

  @override
  State<CropTypesPage> createState() => _CropTypesPageState();
}

class _CropTypesPageState extends State<CropTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffe1f6cb),
        title: Text('Crop Types'),
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
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 25,),
                SizedBox(
                  height: 185,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VegetablePage(),
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
                            bottom: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/vegetables.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Vegetables",
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
                SizedBox(
                  height: 185,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FruitPage(),
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
                            bottom: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/fruit.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Fruits",
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
            Row(
              children: [
                SizedBox(width: 25,),
                //YamsPage()
                SizedBox(
                  height: 185,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YamsPage(),
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
                            bottom: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/yams.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Yams',
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
                SizedBox(
                  height: 185,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaddyPage(),
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
                            bottom: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/paddy.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Paddy',
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
              height: 185,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PulsesPage(),
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
                        bottom: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                          child: Image.asset('assets/images/pulses.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign:TextAlign.center,
                              'Pulses and \nCereals',
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
