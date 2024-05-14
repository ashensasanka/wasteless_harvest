import 'package:farmer/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../constants/constants.dart';
import '../../models/enrollers.dart';
import '../crop_management/add_crops_page.dart';
import '../crop_management/my_crops_page.dart';
import '../screens/farmer_home_page.dart';
import '../screens/onboarding_screen.dart';
import '../screens/signin_buyer_page.dart';
import '../screens/signin_farmer_page.dart';
import '../screens/signing_aexpert_page.dart';

class CropManagementPage extends StatefulWidget {
  final String username;
  const CropManagementPage({super.key, required this.username});

  @override
  State<CropManagementPage> createState() => _CropManagementPageState();
}

class _CropManagementPageState extends State<CropManagementPage> {
  @override
  Widget build(BuildContext context) =>
      GetBuilder<HomeController>(builder: (ctrl) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe1f6cb),
            title: Text('Crop Management'),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyCropsPage(username: widget.username),
                            ),
                          );
                          ctrl.fetchMycrops(widget.username);
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                right: 10,
                                bottom: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      20), // Adjust the radius according to your preference
                                  child:
                                      Image.asset('assets/images/my_crops.jpg'),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 37,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'My Crops',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddCropsPage(username: widget.username),
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
                            bottom: 55,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius according to your preference
                              child: Image.asset('assets/images/add_crops.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Add Crops',
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
      });
}
