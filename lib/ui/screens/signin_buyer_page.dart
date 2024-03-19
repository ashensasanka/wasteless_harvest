import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/ui/screens/enroller_page.dart';
import 'package:farmer/ui/screens/signup_buyer_page.dart';
import 'package:flutter/material.dart';
import 'package:farmer/constants/constants.dart';
import 'package:farmer/ui/screens/root_page.dart';
import 'package:farmer/ui/screens/forgot_password.dart';
import 'package:farmer/ui/screens/signup_farmer_page.dart';
import 'package:farmer/ui/widgets/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';

import 'buyer_root_page.dart';


class SignInBuyer extends StatefulWidget {
  const SignInBuyer({Key? key}) : super(key: key);

  @override
  State<SignInBuyer> createState() => _SignInBuyerState();
}

class _SignInBuyerState extends State<SignInBuyer> {
  TextEditingController signbuyerusernameController = TextEditingController();
  TextEditingController signbuyerpasswordController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const EnrollerPage())); // Navigate back when the back button is pressed
                },
              ),
              Image.asset('assets/images/signin.png'),
              const Text(
                'Sign In Buyer',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              textFeld(
                hintText: "Enter User Name....",
                icon: Icons.account_circle,
                inputType: TextInputType.text,
                maxLines: 1,
                controller: signbuyerusernameController,
              ),
              TextField(
                controller: signbuyerpasswordController,
                style: const TextStyle(color: Colors.black, fontSize: 14.5),
                obscureText: isPasswordVisible ? false : true,
                decoration: InputDecoration(
                  fillColor: Color(0xffbce8ca),
                  filled: true,
                  prefixIconConstraints: const BoxConstraints(minWidth: 45),
                  prefixIcon: Container(
                    height: 35,
                    margin: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(minWidth: 45, maxWidth: 46),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Password....',
                  hintStyle: const TextStyle(color: Color.fromRGBO(75, 93, 81, 1), fontSize: 16.5), // Set hint color here
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    // Get the document snapshot from Firestore
                    var snapshot = await FirebaseFirestore.instance.collection('buyer_users').doc(signbuyerusernameController.text).get();

                    // Check if the document exists
                    if (snapshot.exists) {
                      // Retrieve the username and password from the document data
                      var data = snapshot.data();
                      var username = data?['username'];
                      var password = data?['password'];

                      // Check if entered username and password match the data from Firestore
                      if (signbuyerusernameController.text == username &&
                          signbuyerpasswordController.text == password) {
                        // Navigate to the root page
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const BuyerRootPage(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      } else {
                        // Display an error message for incorrect credentials
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Incorrect username or password")),
                        );
                      }
                    } else {
                      // Display an error message if the document doesn't exist
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("User not found")),
                      );
                    }
                  } catch (error) {
                    // Handle any errors that occur during the Firestore operation
                    print("Error fetching user data: $error");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("An error occurred. Please try again later.")),
                    );
                  }
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Forgot Password? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Reset Here',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignUpBuyer(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'New to Planty? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          cursorColor: Colors.green,
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green,
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
                color: Colors.blueGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: hintText,
            alignLabelWithHint: true,
            border: InputBorder.none,
            fillColor: Color(0xffbce8ca),
            filled: true,
          ),
        ));
  }
}
