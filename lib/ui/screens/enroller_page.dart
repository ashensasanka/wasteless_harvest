import 'package:farmer/provider/auth_provider.dart';
import 'package:farmer/ui/screens/farmer_home_page.dart';
import 'package:farmer/ui/screens/signin_buyer_page.dart';
import 'package:farmer/ui/screens/signin_farmer_page.dart';
import 'package:farmer/ui/screens/signing_aexpert_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../../models/enrollers.dart';
import 'lets_start_page.dart';
import 'onboarding_screen.dart';

class EnrollerPage extends StatefulWidget {
  const EnrollerPage({super.key});

  @override
  State<EnrollerPage> createState() => _EnrollerPageState();
}

class _EnrollerPageState extends State<EnrollerPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Enroller> _enrollList = Enroller.enrollList;
    final ap = Provider.of<AuthProvider1>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/enroller_back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const StartPage())); // Navigate back when the back button is pressed
                      },
                    ),
                    SizedBox(height: 160,),
                  ],
                ),
                SizedBox(width: 40,),
                SizedBox(
                  height: size.height * .3,
                  child: GestureDetector(
                    onTap: () {
                      ap.isSignedIn == true
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=> const FarmerHomePage(username: '',)))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInFarmer(),
                          ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 55,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100), // Adjust the radius according to your preference
                              child: Image.asset(_enrollList[0].imageURL),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _enrollList[0].enrollName,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: size.height * .3,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const SignInBuyer()));
                },
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100), // Adjust the radius according to your preference
                          child: Image.asset(_enrollList[1].imageURL),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _enrollList[1].enrollName,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff73B633),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: size.height * .3,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const SignInAExpert()));
                },
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100), // Adjust the radius according to your preference
                          child: Image.asset(_enrollList[2].imageURL),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Agricultural\nExpert',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
