import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constants/constants.dart';
import '../../controller/home_controller.dart';
import '../widgets/drop_down_btn.dart';
import 'edit_card.dart';
import 'my_crops_page.dart';
import 'package:intl/intl.dart';

class EditCropPage extends StatefulWidget {
  final int index;
  final String plant_date;
  final String harvest_date;

  const EditCropPage(
      {super.key,
      required this.index,
      required this.plant_date,
      required this.harvest_date});

  @override
  State<EditCropPage> createState() => _EditCropPageState();
}

class _EditCropPageState extends State<EditCropPage> {
  final userCollection = FirebaseFirestore.instance.collection("farmer");
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () async {
              await saveNewValue(field, newValue);
              Navigator.of(context).pop(newValue);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveNewValue(String field, String newValue) async {
    if (newValue.trim().isEmpty) return;

    // Query the collection to find the document with the specified ID
    QuerySnapshot querySnapshot = await userCollection
        .where('id', isEqualTo: "aLfB0xeahWG4tWKZ5ibB")
        .get();

    // Check if any documents are found
    if (querySnapshot.docs.isNotEmpty) {
      // Access the first document found (assuming there's only one)
      String documentId = querySnapshot.docs.first.id;

      // Update the field in the document
      await userCollection.doc(documentId).update({field: newValue});
    }
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    super.initState();
    // update();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  trigerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Fertilizer Notification',
          body: 'Now you have to add Fertilizers to your Field'),
    );
  }

  double _initial = 0.0;
  late Timer _timer;



  @override

  Widget build(BuildContext context) {
    void update() {
      _timer = Timer.periodic(
        Duration(seconds: 10),
            (timer) {
          setState(
                () {
              if (_initial < 1) {
                _initial += 0.04;
                trigerNotification();
              } else {
                _timer.cancel();
              }
              print(_initial);
            },
          );
        },
      );
    }
    update();
    String dropdownValue = '1';
    int multipliedValue = 5;
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return RefreshIndicator(
          onRefresh: () async {
            ctrl.fetchMycrops('');
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Edit Crop'),
              // Add leading back button to navigate to HomePage
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 2.6,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return EditCard(
                          imageUrl:
                              ctrl.cropsShowInUi[widget.index].image ?? 'url',
                        );
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Text(
                    '${ctrl.cropsShowInUi[widget.index].name ?? 'No name'}',
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 185,
                        child: Container(
                          width: 176,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Crop Description",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 185,
                        child: Container(
                          width: 176,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Fertilizer",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 150,
                                      // Add padding to ensure the row doesn't get squished
                                      child: Row(
                                        children: [
                                          Text(
                                            "Planted Date:",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () =>
                                                editField('plant_date'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "${widget.plant_date}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Harvested Date",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${_getNewPlantDate(widget.plant_date)}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Text(
                    'For paid version',
                    style: const TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'How to plant',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'How to Harvest',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Expected Harvest',
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 85, // Set width as per your requirement
                        height: 35, // Set height as per your requirement
                        child: DropDownBtn(
                          items: const [
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10',
                            '11',
                            '12'
                          ],
                          selectedItemText: dropdownValue,
                          onSelected: (selectedValue) {
                            dropdownValue = selectedValue ?? '';
                            multipliedValue = int.parse(dropdownValue) * 9;
                            ctrl.update();
                          },
                        ),
                      ),
                      Text('kg   ', style: TextStyle(fontSize: 15)),
                      Text(
                        'Expected: $multipliedValue kg',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'When to use fertilizers',
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 220,
                        child: LinearProgressIndicator(
                          value: _initial,
                          minHeight: 5,
                          valueColor: AlwaysStoppedAnimation(Colors.green),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Diseases with Images',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Treatments for diseases',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Seasonal Changes',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'How to pack properly for transport',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Check Sustainable level(Upload pictures of sustainable \npractice to see sustainable level) ',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCropsPage(
                              username: '',
                            ),
                          ),
                        );
                      },
                      child: Text('Save'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green), // Change the color here
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

String _getNewPlantDate(String originalDate) {
  // Define the input date format
  DateFormat inputFormat = DateFormat('dd/MM/yyyy');

  // Parse the original date string into a DateTime object
  DateTime parsedDate = inputFormat.parse(originalDate);

  // Add three days to the parsed date
  DateTime newDate = parsedDate.add(Duration(days: 180));

  // Format the new date as a string in the original format
  String formattedDate = inputFormat.format(newDate);

  return formattedDate;
}
