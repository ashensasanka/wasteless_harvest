import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/model/crops/crops.dart';
import 'package:farmer/model/rate_comment/rate_comment.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/add_listing/add_listing.dart';
import '../model/message/message.dart';
import '../model/post_details/postdetails.dart';
import '../model/user1_comment/user1_comment.dart';

class HomeController extends GetxController{
  String test = 'test string';

  // defined the variables as FirebaseFirestore store data as key value and FirebaseStorage store data as files
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  //Defined the Collections variables of database
  late CollectionReference cropCollection;
  late CollectionReference addlistingCollection;
  late CollectionReference postdetailsCollection;
  late CollectionReference messageCollection;
  late CollectionReference listingCollection;
  late CollectionReference commentCollection;
  late CollectionReference user1commentCollection;
  
  // Text controllers from Add product page
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController cropPlantCtrl = TextEditingController();
  TextEditingController cropHarvestCtrl = TextEditingController();
  // Text Create listing
  TextEditingController addlistNameCtrl = TextEditingController();
  TextEditingController addlistImgCtrl = TextEditingController();
  TextEditingController addlistAmountCtrl = TextEditingController();
  TextEditingController addlistStartPriceCtrl = TextEditingController();

  // Text controller from FB account create page
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  // Text controller from Post Caption page
  TextEditingController challengeDescriptionCtrl = TextEditingController();
  TextEditingController challengeTitleCtrl = TextEditingController();
  TextEditingController challengeEmailCtrl = TextEditingController();
  // Text controller from message page
  TextEditingController messageController = TextEditingController();
  TextEditingController user1commeController = TextEditingController();
  // Text controller from seller message page
  TextEditingController sellerMessageController = TextEditingController();
  //Define the type of value
  DateTime birthday = DateTime.now();
  DateTime? logday;
  String? lat,long;
  String croptype = 'Type';
  String cropcatg = 'Category';
  List<String> cropcatgItems = [];
  String addlistingtype = 'Type';
  String brand = 'Fish Category';
  String from = 'To';
  bool offer = false;
  File? selectedImage;
  File? postImage;
  String gender = 'male';

  //List of Products Add and Show
  List<Crops> crops = []; //fetchMycrops
  List<Crops> cropsShowInUi = []; //fetchMycrops
  // //List of Products Cart and Show
  List<Crops> listings = []; //fetchListingDetails
  List<Crops> listingsShowInUi = []; //fetchListingDetails || ShopPage()
  List<AddListing> farmerlistingsShowInUi = []; //fetchfarmerListingDetails || MyListingPage()
  List<RateComment> ratecommentShowInUi = []; //fetchRatesComment
  //List of Post create and Show
  List<PostDetails> postdetails = []; //fetchPostsList
  List<PostDetails> postShowUi = []; //fetchPostsList
  //List of Message send and Show

  List<Message> messageUi = []; //fetchMessage
  List<User1Comment> user1commentUi = []; //fetchuser1Comment

  // Notify about loging details
  void handleDateSelection(DateTime selectedDate) {
    logday = selectedDate;
    update(); // Notify listeners about the change
  }

  // Initiate the database collections and Fetch the data
  @override
  void onInit() async {
    // TODO: implement onInit
    cropCollection = firestore.collection('farmer'); //addCrop, fetchMycrops
    addlistingCollection =firestore.collection('add_listing'); //addListing, fetchfarmerListingDetails
    postdetailsCollection = firestore.collection('postdetails'); //addPost, fetchPostsList
    messageCollection = firestore.collection('message'); //addMessage, fetchMessage
    listingCollection = firestore.collection('farmer'); //fetchListingDetails
    commentCollection = firestore.collection('rate_comment'); //fetchRatesComment
    user1commentCollection = firestore.collection('user_1'); //add1CommentRate, fetchuser1Comment
    await fetchMycrops();
    await fetchPostsList();
    await fetchMessage();
    await fetchfarmerListingDetails();
    await fetchListingDetails();
    await fetchRatesComment();
    await fetchuser1Comment();
    super.onInit();
  }
  add1CommentRate(){
    try {
      int pressingTime = DateTime.now().toUtc().millisecondsSinceEpoch;
      DocumentReference doc = user1commentCollection.doc('$pressingTime'); //user_1
      User1Comment message = User1Comment(
        id:doc.id,
        message:user1commeController.text,
        pressingTime: DateTime.now().toUtc().millisecondsSinceEpoch,
      );
      final messageJson = message.toJson();
      doc.set(messageJson);
      // Get.snackbar('Success', 'Message added successfully', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }
  // Add messages into message collection
  addMessage(){
    try {
      int pressingTime = DateTime.now().toUtc().millisecondsSinceEpoch;
      DocumentReference doc = messageCollection.doc('$pressingTime'); //message
      Message message = Message(
        id:doc.id,
        message:messageController.text,
        pressingTime: DateTime.now().toUtc().millisecondsSinceEpoch,
      );
      final messageJson = message.toJson();
      doc.set(messageJson);
      // Get.snackbar('Success', 'Message added successfully', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }
  // Add product details into product collection
  addCrop(){
    try {
      DocumentReference doc = cropCollection.doc(); //farmer
      Crops crops = Crops(
        id:doc.id,
        name:cropcatg,
        type: croptype,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        image: productImgCtrl.text,
        plant_date:cropPlantCtrl.text,
        harvest_date:cropHarvestCtrl.text
      );
      final productJson = crops.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product added successfully', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }
  //create_new_listing, FarmerAddListing
  addListing(){
    DateTime currentDate = DateTime.now();
    String trimmedDate = DateTime(currentDate.year, currentDate.month, currentDate.day).toString();
    String result = trimmedDate.split(' ')[0];//create_new_listing, FarmerAddListing
    try {
      DocumentReference doc = addlistingCollection.doc(); //add_listing
      AddListing addlisting = AddListing(
          id:doc.id,
          name:addlistNameCtrl.text,
          type: addlistingtype,
          image: addlistImgCtrl.text,
          amount:double.tryParse(addlistAmountCtrl.text),
          stating_price:double.tryParse(addlistStartPriceCtrl.text),
          hbidname:'',
          date:result,
          hbid:double.tryParse(addlistStartPriceCtrl.text),
      );
      final productJson = addlisting.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product added successfully', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }
  // Set the values to default values
  addPost(File? selectedImage, String filetype) async {
    try {
      if (selectedImage == null) {
        Get.snackbar('Error', 'Please select an image', colorText: Colors.red);
        return;
      }

      final imagePath = 'post/ashenfdbd${DateTime.now().millisecondsSinceEpoch}';
      final Reference storageReference = storage.ref().child(imagePath);

      // Specify content type as 'image/jpeg'
      final metadata = SettableMetadata(contentType: filetype);

      await storageReference.putFile(selectedImage, metadata);
      final String imageUrl = await storageReference.getDownloadURL();

      final DocumentReference doc = postdetailsCollection.doc(); //postdetails
      final PostDetails postdetails = PostDetails(
          id: doc.id,
          description: challengeDescriptionCtrl.text,
          filetype: filetype,
          image: imageUrl, // Add this field to your ChatDetails model
          from: from,
          title: challengeTitleCtrl.text,
          email: challengeEmailCtrl.text
      );

      final Map<String, dynamic> postdetailsJson = postdetails.toJson();
      await doc.set(postdetailsJson);

      Get.snackbar('Success', 'Post added successfully', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  setValuesDefault(){
    addlistNameCtrl.clear();
    addlistImgCtrl.clear();
    addlistAmountCtrl.clear();
    addlistStartPriceCtrl.clear();
    addlistingtype= 'Type';
    productNameCtrl.clear();
    productPriceCtrl.clear();
    productDescriptionCtrl.clear();
    productImgCtrl.clear();
    cropPlantCtrl.clear();
    cropHarvestCtrl.clear();
    croptype = 'Type';
    update();
  }

  fetchuser1Comment() async {
    try {
      QuerySnapshot cartdetailsSnapshot = await user1commentCollection.get(); //user_1
      final List<User1Comment> retrievedLog = cartdetailsSnapshot.docs.map((doc) => User1Comment.fromJson(doc.data() as Map<String, dynamic>)).toList();
      user1commentUi.clear();
      user1commentUi.assignAll(retrievedLog);
      Get.snackbar('Success', 'CartDetails fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }

  fetchfarmerListingDetails() async {
    try {
      QuerySnapshot cartdetailsSnapshot = await addlistingCollection.get(); //add_listing
      final List<AddListing> retrievedLog = cartdetailsSnapshot.docs.map((doc) => AddListing.fromJson(doc.data() as Map<String, dynamic>)).toList();
      farmerlistingsShowInUi.clear();
      farmerlistingsShowInUi.assignAll(retrievedLog);
      Get.snackbar('Success', 'FarmerListing fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }
  // Fetch the cart details from cart details collection
  fetchListingDetails() async {
    try {
      QuerySnapshot cartdetailsSnapshot = await listingCollection.get(); //farmer
      final List<Crops> retrievedLog = cartdetailsSnapshot.docs.map((doc) => Crops.fromJson(doc.data() as Map<String, dynamic>)).toList();
      listings.clear();
      listings.assignAll(retrievedLog);
      listingsShowInUi.assignAll(listings); //BidsWon(),  ShopPage()
      Get.snackbar('Success', 'CartDetails fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }

  fetchRatesComment() async {
    try {
      QuerySnapshot ratecommentSnapshot = await commentCollection.get(); //rate_comment
      final List<RateComment> retrievedLog = ratecommentSnapshot.docs.map((doc) => RateComment.fromJson(doc.data() as Map<String, dynamic>)).toList();
      ratecommentShowInUi.clear();
      ratecommentShowInUi.assignAll(retrievedLog);
      Get.snackbar('Success', 'CartDetails fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }
  // Fetch the messages from message collection
  fetchMessage() async {
    try {
      QuerySnapshot messageSnapshot = await messageCollection.get(); //message
      final List<Message> retrievedMessage = messageSnapshot.docs
          .map((doc) => Message.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      messageUi.clear();
      messageUi.assignAll(retrievedMessage);
      Get.snackbar('Success', 'Message fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }
  // Fetch the products details from the product details collection
  fetchMycrops() async {
    try {
      QuerySnapshot productSnapshot = await cropCollection.get(); //farmer
      final List<Crops> retrievedProducts = productSnapshot.docs.map((doc) => Crops.fromJson(doc.data() as Map<String, dynamic>)).toList();
      crops.clear();
      crops.assignAll(retrievedProducts);
      cropsShowInUi.assignAll(crops);
      Get.snackbar('Success', 'Product fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }
  // Fetch the post details from the post details collection
  fetchPostsList() async{
    try {
      QuerySnapshot postSnapshot = await postdetailsCollection.get(); //postdetails
      final List<PostDetails> retrievedPost = postSnapshot.docs.map((doc) => PostDetails.fromJson(doc.data() as Map<String, dynamic>)).toList();
      postdetails.clear();
      postdetails.assignAll(retrievedPost);
      postShowUi.assignAll(postdetails);
      Get.snackbar('Success', 'Post fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }
  // Delete the products from database
  deleteProduct(String id) async {
    try {
      await cropCollection.doc(id).delete();
      fetchMycrops();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }
}