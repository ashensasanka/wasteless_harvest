import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import '../widgets/drop_down_btn.dart';

class FarmerAddListing extends StatefulWidget {
  const FarmerAddListing({super.key});

  @override
  State<FarmerAddListing> createState() => _FarmerAddListingState();
}

class _FarmerAddListingState extends State<FarmerAddListing> {
  @override
  Widget build(BuildContext context) =>
      GetBuilder<HomeController>(builder:(ctrl) {
        return Scaffold(
          backgroundColor:Color(0xffe1f6cb),
          appBar: AppBar(
            backgroundColor:Color(0xffe1f6cb),
            title: Text('Create Listings'),
            // Add leading back button to navigate to HomePage
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_back.jpg'), // Replace 'assets/background_image.jpg' with your image path
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.all(10),
              width: 400,
              height: 720,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  TextField(
                    controller: ctrl.addlistNameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black), // Change border color here
                      ),
                      labelText: 'Name', // Changed 'label' to 'labelText' for the newer version of Flutter
                      hintText: 'Enter Name',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold), // Make label bold
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.addlistImgCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Image URL'),
                        hintText: 'Enter Your Image URL'
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.addlistAmountCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Amount (kg)'),
                        hintText: 'Enter Amount'
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 200, // Set width as per your requirement
                    color: Colors.green, // Set the desired background color here
                    child: DropDownBtn(
                      items: const ['Type5', 'Type6', 'Type7', 'Type8'],
                      selectedItemText: ctrl.addlistingtype,
                      onSelected: (selectedValue) {
                        ctrl.addlistingtype = selectedValue ?? 'Type';
                        ctrl.update();
                      },
                    ),
                  ),

                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.addlistStartPriceCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Starting Price (Rs: )'),
                        hintText: 'Starting Price'
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(170, 40), // Set width and height as per your requirement
                    ),
                    onPressed: () {
                      ctrl.addListing();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                        return AlertDialog(
                          title: Column(
                            children: [
                              Center(
                                child: Text(
                                  "Listing Successfully Created",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Icon(Icons.verified_outlined, size: 50,)
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Ok"),
                            ),
                          ],
                        );
                      },
                      );
                    },
                    child: const Text('Create', style: TextStyle(fontSize: 20),),
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ),
        );
      });
}
