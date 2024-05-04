import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../controller/home_controller.dart';
import '../widgets/drop_down_btn.dart';

class FarmerAddListing extends StatefulWidget {
  final String username;
  const FarmerAddListing({super.key, required this.username});

  @override
  State<FarmerAddListing> createState() => _FarmerAddListingState();
}

class _FarmerAddListingState extends State<FarmerAddListing> {
  List<String> getCategoriesForCropType(String cropType) {
    switch (cropType) {
      case 'Paddy':
        return ['Nadu rice', 'Red rice'];
      case 'Vegetables':
        return ['Carrot', 'Beetroot'];
      case 'Fruits':
        return ['Mango', 'Ranbuttan'];
      case 'Yams':
        return ['Ratala', 'Kiri ala'];
      case 'Pulses and ceriels':
        return ['Green Gram (Mung Beans)', 'Cowpeas'];
      default:
        return [];
    }
  }
  File? _image;

  Future<void> _getImageFromGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Container(
                    width: 200, // Set width as per your requirement
                    color: Colors.green, // Set the desired background color here
                    child: DropDownBtn(
                      items: const ['Paddy', 'Vegetables', 'Fruits', 'Yams', 'Pulses and ceriels'],
                      selectedItemText: ctrl.listingtype,
                      onSelected: (selectedValue) {
                        setState(() {
                          ctrl.listingtype = selectedValue ?? 'Type';
                          ctrl.listingcatgItems  = getCategoriesForCropType(selectedValue ?? '');
                        });
                        ctrl.update();
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 200, // Set width as per your requirement
                    color: Colors.green, // Set the desired background color here
                    child: DropDownBtn(
                      items: ctrl.listingcatgItems,
                      selectedItemText: ctrl.listingcatg,
                      onSelected: (selectedValue) {
                        ctrl.listingcatg = selectedValue ?? 'Category';
                        ctrl.update();
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: _getImageFromGallery,
                    child: Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white, // Set the background color
                        borderRadius:
                        BorderRadius.circular(20), // Round the borders
                      ),
                      child: _image != null
                          ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )
                          : Icon(
                        Icons
                            .add_photo_alternate, // Add an icon for image selection
                        size: 100,
                        color: Colors.grey, // Set the icon color
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                      ctrl.addListing(widget.username,_image, 'image');
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
                      _image=null;
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
