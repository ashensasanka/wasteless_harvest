import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BPaymentPage extends StatefulWidget {
  final String userName;
  const BPaymentPage({super.key, required this.userName});

  @override
  State<BPaymentPage> createState() => _BPaymentPageState();
}

class _BPaymentPageState extends State<BPaymentPage> {
  bool isChecked = false;
  TextEditingController _cardnumEditingController = TextEditingController();
  TextEditingController _exdateEditingController = TextEditingController();
  TextEditingController _cvvEditingController = TextEditingController();
  bool isTextFieldVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe1f6cb),
        title: Text('Upgrade'),
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
              image: AssetImage(
                  'assets/images/home_back.jpg'), // Replace 'assets/background_image.jpg' with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 35,
                color: Colors.lightGreen,
                child: Center(
                  child: Text(
                    'Features of the premium version',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //Full access to education resources for farmers
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                    Text(
                      '  Full access to education resources for farmers  ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                  ],
                ),
              ),
              //Access to community forum
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                    Text(
                      '                  Access to community forum                  ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                  ],
                ),
              ),
              //Full access market for buyers
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                    Text(
                      '                 Full access market for buyers                 ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                  ],
                ),
              ),
              //Full access to crop management for farmers
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                    Text(
                      '    Full access to crop management for farmers    ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                  ],
                ),
              ),
              //By following the procedures can minimize crop waste and maximize profit
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                    Text(
                      ' By following the procedures can minimize crop   \nwaste and maximize profit',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                  ],
                ),
              ),
              //30 day free trial period
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                    Text(
                      '                      30 day free trial period                        ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.lightGreen,
                child: Center(
                  child: Text(
                    'Please enter below details to upgrade to the premium version',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 350,
                color: Color(0xffD9D9D9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Payment  Gateway',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.black,
                    ),
                    Center(
                      child: Text(
                        'Price:  Rs:5000.00',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      '     Pay with:',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Visa or Master
                    Row(
                      children: [
                        SizedBox(width: 80,),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                color: isChecked ? Colors.blue : Colors.transparent,
                              ),
                            ),
                          ),
                        Text(
                          '  Visa:',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(Icons.credit_card),
                        SizedBox(width: 20,),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                color: !isChecked ? Colors.blue : Colors.transparent,
                              ),
                            ),
                          ),
                        Text(
                          '  Master:',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(Icons.credit_card),
                      ],
                    ),
                    SizedBox(height:20,),
                    //Card number
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 140,
                          child: Text(
                            '     Card Number:',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 200,
                          child: TextField(
                            controller: _cardnumEditingController,
                            maxLength: 12,
                            inputFormatters: [LengthLimitingTextInputFormatter(12)],
                            decoration: InputDecoration(
                              hintText: 'Enter card number...',
                              border: OutlineInputBorder(),
                                hintStyle:TextStyle(),
                              contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 10,),
                    //Expire date
                    Row(
                      children: [
                        Text(
                          '     Expiry Date:',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 30,
                          width: 120,
                          child: TextField(
                            controller: _exdateEditingController,
                            decoration: InputDecoration(
                              hintText: 'MM/YY',
                              border: OutlineInputBorder(),
                              hintStyle:TextStyle(),
                              contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    //CVV
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 70,
                          child: Text(
                            '     CVV:',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 90,
                          child: TextField(
                            controller: _cvvEditingController,
                            maxLength: 3,
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            decoration: InputDecoration(
                              hintText: 'CVV',
                              border: OutlineInputBorder(),
                              hintStyle:TextStyle(),
                              contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 280,),
                        ElevatedButton(
                          onPressed: () {
                            if (_cardnumEditingController.text.length != 12) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Please enter valid card number before confirming.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          // Close the dialog
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            else{
                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirmation'),
                                    content: Text('Are you sure you want to activate the premium?'),
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
                                            isTextFieldVisible = !isTextFieldVisible;
                                            // Update premium field in Firestore
                                            FirebaseFirestore.instance.collection('buyer_users').doc(widget.userName).update({
                                              'premium': true,
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
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                          ),
                          child: Text('Confirm'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
