import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../controller/home_controller.dart';
import '../widgets/drop_down_btn.dart';

class AddCropsPage extends StatefulWidget {
  final String username;
  const AddCropsPage({super.key, required this.username});

  @override
  State<AddCropsPage> createState() => _AddCropsPageState();
}

class _AddCropsPageState extends State<AddCropsPage> {

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
  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
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
                children: <Widget>[
                  const SizedBox(height: 15),
                  Container(
                    width: 200, // Set width as per your requirement
                    color: Colors.green, // Set the desired background color here
                    child: DropDownBtn(
                      items: const ['Paddy', 'Vegetables', 'Fruits', 'Yams', 'Pulses and ceriels'],
                      selectedItemText: ctrl.croptype,
                      onSelected: (selectedValue) {
                        setState(() {
                          ctrl.croptype = selectedValue ?? 'Type';
                          ctrl.cropcatgItems  = getCategoriesForCropType(selectedValue ?? '');
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
                      items: ctrl.cropcatgItems,
                      selectedItemText: ctrl.cropcatg,
                      onSelected: (selectedValue) {
                        ctrl.cropcatg = selectedValue ?? 'Category';
                        ctrl.update();
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      ctrl.getImageUrlForCropCategory(ctrl.cropcatg),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  // TextField(
                  //   controller: ctrl.cropPlantCtrl,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     labelText: 'Plant Date',
                  //     hintText: 'Enter Plant Date (DD/MM/YYYY)',
                  //   ),
                  //   keyboardType: TextInputType.datetime,
                  // ),
                  _selectedDate != null
                      ? Text(
                      'Selected Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}')
                      : Text('No date selected'),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(170, 40), // Set width and height as per your requirement
                    ),
                    onPressed: () {
                      DateTime? harvestDate = _selectedDate?.add(Duration(days: 66));
                      ctrl.addCrop(widget.username,'${DateFormat('dd/MM/yyyy').format(_selectedDate!)}','${DateFormat('dd/MM/yyyy').format(harvestDate!)}'); //
                    },
                    child: const Text('Add Crop'),
                  ),
                  SizedBox(height: 180,)
                ],
              ),
            ),
          ),
      );
    });
}
