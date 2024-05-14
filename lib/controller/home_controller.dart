import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/model/crops/crops.dart';
import 'package:farmer/model/rate_comment/rate_comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../model/add_listing/add_listing.dart';
import '../model/message/message.dart';
import '../model/post_details/postdetails.dart';
import '../model/user1_comment/user1_comment.dart';
import '../model/users/users.dart';

class HomeController extends GetxController{
  String test = 'test string';

  // defined the variables as FirebaseFirestore store data as key value and FirebaseStorage store data as files
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  User? user = FirebaseAuth.instance.currentUser;
  //Defined the Collections variables of database
  late CollectionReference usersCollection;
  late CollectionReference cropCollection;
  late CollectionReference addlistingCollection;
  late CollectionReference postdetailsCollection;
  late CollectionReference messageCollection;
  late CollectionReference listingCollection;
  late CollectionReference commentCollection;
  late CollectionReference user1commentCollection;
  
  // Text controllers from Add product page
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController cropPlantCtrl = TextEditingController();
  TextEditingController cropHarvestCtrl = TextEditingController();
  // Text Create listing
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
  String listingtype = 'Type';
  String cropcatg = 'Crop Name';
  String listingcatg = 'Crop Name';
  List<String> cropcatgItems = [];
  List<String> listingcatgItems = [];
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
  List<Users> usersShow = [];

  List<Message> message = [];
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
    usersCollection = firestore.collection('farmer_users');
    addlistingCollection =firestore.collection('add_listing'); //addListing, fetchfarmerListingDetails
    postdetailsCollection = firestore.collection('postdetails'); //addPost, fetchPostsList
    messageCollection = firestore.collection('message'); //addMessage, fetchMessage
    listingCollection = firestore.collection('farmer'); //fetchListingDetails
    commentCollection = firestore.collection('rate_comment'); //fetchRatesComment
    user1commentCollection = firestore.collection('user_1'); //add1CommentRate, fetchuser1Comment
    // await fetchMycrops();
    await fetchPostsList();
    await fetchfarmerListings('');
    await fetchMycrops('');
    await fetchUserDetails();
    await fetchRatesComment();
    await fetchuser1Comment();
    super.onInit();
  }

  String getImageUrlForCropCategory(String cropCategory) {
    switch (cropCategory) {
      case 'Red rice':
        return 'https://w7.pngwing.com/pngs/459/740/png-transparent-green-wheat-rice-paddy-field-rice-paddy-grass-paddy-plantation-thumbnail.png';
      case 'Nadu rice':
        return 'https://w7.pngwing.com/pngs/459/740/png-transparent-green-wheat-rice-paddy-field-rice-paddy-grass-paddy-plantation-thumbnail.png';
      case 'Carrot':
        return 'https://www.shutterstock.com/image-photo/carrot-isolated-on-white-background-600nw-795704785.jpg';
      case 'Beetroot':
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToIeorunW12mLROfwi7xTyb7Jk_9kjN0rtzAbIVLnVwg&s';
      case 'Mango':
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK5-BXZ8nS191UtUteJqB_iLbahSam1PDdYweqpAzqng&s';
      case 'Ranbuttan':
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZuh6vrwpMrvHyWs5ZNR-701Z5YbBk58ZGPuWmGl9bA&s';
      case 'Ratala':
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW88VEtkuuY_WOTzBk1q2SWaCrAH4HddwaxBHfaa2jyA&s';
      case 'Kiri ala':
        return 'https://doa.gov.lk/wp-content/uploads/2020/07/isuru-kiriala.png';
      case 'Green Gram (Mung Beans)':
        return 'https://media.istockphoto.com/id/1310279351/photo/macro-close-up-of-organic-green-gram-or-whole-green-moong-dal-on-a-white-ceramic-soup-spoon.jpg?s=612x612&w=0&k=20&c=Egs5PIbNT46cLexABLLAwQ1mjp4cH6qGbYK3KYEkY3Q=';
      case 'Cowpeas':
        return 'https://m.media-amazon.com/images/I/51TezATUHML._AC_UF1000,1000_QL80_.jpg';

      default:
        return 'https://upload.wikimedia.org/wikipedia/commons/5/59/Empty.png';
    }
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
  addMessage( String uid){
    CollectionReference messageColl = FirebaseFirestore.instance.collection(uid);
    try {
      int pressingTime = DateTime.now().toUtc().millisecondsSinceEpoch;
      DocumentReference doc = messageColl.doc('$pressingTime');
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
  addCrop(String username, String plantDate, String harvestDate){
    //
      CollectionReference collection = FirebaseFirestore.instance.collection('addcrop${username}');
      try {
        DocumentReference doc = collection.doc(); //farmer
        Crops crops = Crops(
            id:doc.id,
            name:cropcatg,
            type: croptype,
            image: getImageUrlForCropCategory(cropcatg),
            plant_date:plantDate,
            harvest_date:harvestDate
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
  addListing(String userName,File? selectedImage, String filetype) async {
    CollectionReference owncollection = FirebaseFirestore.instance.collection('add_listing${userName}');
    CollectionReference allcollection = FirebaseFirestore.instance.collection('all_listings');
    DateTime currentDate = DateTime.now();
    String trimmedDate = DateTime(currentDate.year, currentDate.month, currentDate.day).toString();
    String result = trimmedDate.split(' ')[0];//create_new_listing, FarmerAddListing
    try {
      if (selectedImage == null){
        Get.snackbar('Error', 'Please select an image', colorText: Colors.red);
        return;
      }
      final imagePath = 'listing/listing${DateTime.now().millisecondsSinceEpoch}';
      final Reference storageReference = storage.ref().child(imagePath);
      final metadata = SettableMetadata(contentType: filetype);
      await storageReference.putFile(selectedImage, metadata);
      final String imageUrl = await storageReference.getDownloadURL();
      DocumentReference owndoc = owncollection.doc();
      DocumentReference alldoc = allcollection.doc();
      AddListing addlisting = AddListing(
          collName:'add_listing${userName}',
          allid:alldoc.id,
          ownid:owndoc.id,
          name:listingcatg,
          type: listingtype,
          image: imageUrl,
          amount:double.tryParse(addlistAmountCtrl.text),
          stating_price:double.tryParse(addlistStartPriceCtrl.text),
          hbidname:'',
          date:result,
          hbid:double.tryParse(addlistStartPriceCtrl.text),
      );
      final productJson = addlisting.toJson();
      owndoc.set(productJson);
      alldoc.set(productJson);
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
    addlistAmountCtrl.clear();
    addlistStartPriceCtrl.clear();
    productNameCtrl.clear();
    cropPlantCtrl.clear();
    cropHarvestCtrl.clear();
    croptype = 'Type';
    cropcatg = '';
    listingtype = 'Type';
    listingcatg ='';
    update();
  }

  fetchUserDetails() async {
    try {
      QuerySnapshot usertailsSnapshot = await usersCollection.get();
      final List<Users> retrievedUsers = usertailsSnapshot.docs.map((doc) => Users.fromJson(doc.data() as Map<String, dynamic>)).toList();
      usersShow.assignAll(retrievedUsers);
      Get.snackbar('Success', 'Users fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
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

  fetchfarmerListings(String username) async {
    CollectionReference collection = FirebaseFirestore.instance.collection('add_listing${username}');
    try {
      QuerySnapshot cartdetailsSnapshot = await collection.get(); //add_listing
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
  fetchallListings() async {
    CollectionReference collection = FirebaseFirestore.instance.collection('all_listings');
    try {
      QuerySnapshot cartdetailsSnapshot = await collection.get(); //add_listing
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
  fetchMycrops(String username) async {
    CollectionReference collection = FirebaseFirestore.instance.collection('addcrop${username}');
    try {
      QuerySnapshot cartdetailsSnapshot = await collection.get(); //farmer
      final List<Crops> retrievedLog = cartdetailsSnapshot.docs.map((doc) => Crops.fromJson(doc.data() as Map<String, dynamic>)).toList();
      cropsShowInUi.clear();
      cropsShowInUi.assignAll(retrievedLog);
      Get.snackbar('Success', 'MyCropDetails fetch successfully', colorText: Colors.green);
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
  fetchMessage(String uid) async {
    CollectionReference messageColl = FirebaseFirestore.instance.collection(uid);
    try {
      QuerySnapshot messageSnapshot = await messageColl.get();
      final List<Message> retrievedMessage = messageSnapshot.docs.map((doc) => Message.fromJson(doc.data() as Map<String, dynamic>)).toList();
      message.clear();
      message.assignAll(retrievedMessage);
      messageUi.assignAll(message);
      // Get.snackbar('Success', 'Message fetch successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally{
      update();
    }
  }
  // Fetch the products details from the product details collection
  // fetchMycrops() async {
  //   try {
  //     QuerySnapshot productSnapshot = await cropCollection.get(); //farmer
  //     final List<Crops> retrievedProducts = productSnapshot.docs.map((doc) => Crops.fromJson(doc.data() as Map<String, dynamic>)).toList();
  //     crops.clear();
  //     crops.assignAll(retrievedProducts);
  //     cropsShowInUi.assignAll(crops);
  //     Get.snackbar('Success', 'Product fetch successfully', colorText: Colors.green);
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString(), colorText: Colors.red);
  //   } finally{
  //     update();
  //   }
  // }
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
  deleteProduct(String id, String username) async {
    CollectionReference collection = FirebaseFirestore.instance.collection('addcrop${username}');
    try {
      await collection.doc(id).delete();
      fetchMycrops(username);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }
}