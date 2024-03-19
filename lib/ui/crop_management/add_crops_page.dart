import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import '../widgets/drop_down_btn.dart';

class AddCropsPage extends StatefulWidget {
  const AddCropsPage({super.key});

  @override
  State<AddCropsPage> createState() => _AddCropsPageState();
}

class _AddCropsPageState extends State<AddCropsPage> {
  @override
  Widget build(BuildContext context) =>
    GetBuilder<HomeController>(builder:(ctrl) {
      return Scaffold(
        backgroundColor:Color(0xffe1f6cb),
        appBar: AppBar(
          backgroundColor:Color(0xffe1f6cb),
          title: Text('Add Crops'),
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
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.productNameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black), // Change border color here
                      ),
                      labelText: 'Crop Name', // Changed 'label' to 'labelText' for the newer version of Flutter
                      hintText: 'Enter Crop Name',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold), // Make label bold
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.productDescriptionCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Crops Description'),
                        hintText: 'Enter Your Crop Description'
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.productImgCtrl,
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
                    controller: ctrl.productPriceCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Crop Price (Rs.)'),
                        hintText: 'Enter Crop Price'
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 200, // Set width as per your requirement
                    color: Colors.green, // Set the desired background color here
                    child: DropDownBtn(
                      items: const ['Type1', 'Type2', 'Type3', 'Type4'],
                      selectedItemText: ctrl.croptype,
                      onSelected: (selectedValue) {
                        ctrl.croptype = selectedValue ?? 'Type';
                        ctrl.update();
                      },
                    ),
                  ),

                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.cropPlantCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Plant Date'),
                        hintText: 'Enter Plant Date (DD/MM/YYYY)'
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.cropHarvestCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Harvest Date'),
                        hintText: 'Enter Harvest Date (DD/MM/YYYY)'
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
                      ctrl.addCrop();
                    },
                    child: const Text('Add Crop'),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
      );
    });
}