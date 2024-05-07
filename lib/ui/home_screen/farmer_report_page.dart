import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/enrollers.dart';
import '../report/farmer_reports_page.dart';
import '../report/statistics.dart';

class FarmerReportPage extends StatefulWidget {
  final String user;
  const FarmerReportPage({super.key, required this.user});

  @override
  State<FarmerReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<FarmerReportPage> {
  bool isPremium = false;

  @override
  void initState() {
    super.initState();
    checkPremiumStatus();
  }

  Future<void> checkPremiumStatus() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('farmer_users')
        .doc(widget.user)
        .get();
    if (userDoc.exists && userDoc.get('premium') == true) {
      setState(() {
        isPremium = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Enroller> _enrollList = Enroller.enrollList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe1f6cb),
        title: Text('Reports'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                SizedBox(
                  height: size.height * .3,
                  child: GestureDetector(
                    onTap: () {
                      if (isPremium) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FarmerReportsPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'You need to be a premium user to access this feature.'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 75,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/report1.jpg'),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Report',
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
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: size.height * .3,
              child: GestureDetector(
                onTap: () {
                  if (isPremium) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatisticsPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'You need to be a premium user to access this feature.'),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20),
                          child: Image.asset('assets/images/statistics.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Statistics',
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
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
