import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../features/chat/presentation/screens/community_screen.dart';
import '../../models/enrollers.dart';
import '../community_forum/community.dart';
import '../community_forum/specific_messaging_page.dart';
import '../crop_management/add_crops_page.dart';
import '../crop_management/my_crops_page.dart';

class CommForPage extends StatefulWidget {
  const CommForPage({super.key});

  @override
  State<CommForPage> createState() => _CommForPageState();
}

class _CommForPageState extends State<CommForPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffe1f6cb),
        title: Text('Community Forum'),
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
            SizedBox(height: 40,),
            Row(
              children: [
                SizedBox(width: 80,),
                SizedBox(
                  height: size.height * .3,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SpecificMessagePage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 75,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/messaging.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign:TextAlign.center,
                                  'Specific \nMessaging',
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
              ],
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: size.height * .3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommunityScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Adjust the radius according to your preference
                          child: Image.asset('assets/images/community1.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Community',
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
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
