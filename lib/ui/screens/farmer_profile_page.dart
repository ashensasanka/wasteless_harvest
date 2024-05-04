import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farmer/constants/constants.dart';
import 'package:farmer/ui/widgets/profile_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../components/text_box.dart';
import '../../models/user_image_model.dart';
import '../../provider/auth_provider.dart';
import '../../provider/firestore.dart';
import '../../utils/utils.dart';
class FarmerProfilePage extends StatefulWidget {
  final String username;
  const FarmerProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  State<FarmerProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<FarmerProfilePage> {
  // final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("farmer_users");
  final FireStoreService fireStoreService = FireStoreService();

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
                hintStyle: const TextStyle(color: Colors.grey)
            ),
            onChanged: (value){
              newValue = value;
            },
          ),
          actions: [
            TextButton(
                onPressed: ()=> Navigator.pop(context),
                child: const Text('Cancel',
                  style: TextStyle(color: Colors.white),)),
            TextButton(
                onPressed: ()=> Navigator.of(context).pop(newValue),
                child: const Text('Save',
                  style: TextStyle(color: Colors.white),)),
          ],
        ));

    if (newValue.trim().isNotEmpty){
      await userCollection.doc(widget.username).update({field: newValue});
    }
  }


  File? image;
  final farmerprofnameController = TextEditingController();
  final farmerprofageController = TextEditingController();
  final farmerprofaddressController = TextEditingController();
  final farmerprofpasswordController = TextEditingController();
  final farmerprofemailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    farmerprofnameController.dispose();
    farmerprofageController.dispose();
    farmerprofaddressController.dispose();
    farmerprofpasswordController.dispose();
    farmerprofemailController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_back.jpg'), // Replace 'assets/background_image.jpg' with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,width: 400,),
                    InkWell(
                        onTap: () => selectImage(),
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: userCollection.doc(widget.username).snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            }
                            final DocumentSnapshot document = snapshot.data!;
                            final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                            return data['imageUrl'] == null? CircleAvatar(
                              backgroundImage: AssetImage("assets/images/propic.png"),
                            ):CircleAvatar(
                              maxRadius: 80,
                              backgroundImage: NetworkImage("${data['imageUrl']}"),
                            );
                          },
                        ),
                      ),
                    StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("farmer_users")
                            .doc(widget.username)
                            .snapshots(),
                        builder: (context, snapshot){
                          if (snapshot.hasData){
                            final userdata = snapshot.data!.data() as Map<String, dynamic>;
                            return SingleChildScrollView(
                              child: Container(
                                width: 350,
                                child: Column(
                                  children: [
                                    MyTextBox(
                                      text: userdata['age'],
                                      sectionName: 'age',
                                      onPressed: ()=> editField('age'),),
                                    MyTextBox(
                                      text: userdata['uid'],
                                      sectionName: 'type',
                                      onPressed: ()=> editField('uid'),),
                                    MyTextBox(
                                      text: userdata['name'],
                                      sectionName: 'name',
                                      onPressed: ()=> editField('name'),),
                                    MyTextBox(
                                      text: userdata['password'],
                                      sectionName: 'password',
                                      onPressed: ()=> editField('password'),),
                                    MyTextBox(
                                      text: userdata['address'],
                                      sectionName: 'address',
                                      onPressed: ()=> editField('address'),),
                                    MyTextBox(
                                      text: userdata['email'],
                                      sectionName: 'email',
                                      onPressed: ()=> editField('email'),),
                                  ],
                                ),
                              ),
                            );
                          } else if (snapshot.hasError){
                            return Center(
                              child: Text('Error${snapshot.error}'),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        fireStoreService.addFProPic(
                            widget.username,
                            image,
                            'image'
                        );
                        Fluttertoast.showToast(
                          msg: "Profile Picture added successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Close the dialog and perform action
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmation'),
                              content: Text('Are you sure you want to deactivate the premium?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Close the dialog and perform action
                                    Navigator.of(context).pop();
                                    setState(() {
                                      // Update premium field in Firestore
                                      FirebaseFirestore.instance.collection('farmer_users').doc(widget.username).update({
                                        'premium': false,
                                      }).then((_) {
                                        print('Premium activated successfully');
                                        // Handle success or additional actions here
                                      }).catchError((error) {
                                        print('Error updating premium: $error');
                                        // Handle error here
                                      });
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.blue,
                                  ),
                                  child: Text('Yes'),
                                ),

                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      child: Text('Unsubscribe'),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
            ),

              ),
        ));
  }
  void storeData() async {
    final ap = Provider.of<AuthProvider1>(context, listen: false);
    UserImageModel userImageModel = UserImageModel(
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
    );
    if (image != null) {
      ap.saveProfImageToFirebase(
        profilePic: image!,
        filetype:"image/jpeg",
        context:context,
        userImageModel: userImageModel
      );
    }else{
      showSnackBar(context, "Please upload your profile photo");
    }
  }

  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.purple,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.purple,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.purple.shade50,
          filled: true,
        ),
      ),
    );
  }
}
