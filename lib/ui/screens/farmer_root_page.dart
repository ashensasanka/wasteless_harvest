import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:farmer/ui/screens/enroller_page.dart';
import 'package:flutter/material.dart';
import 'package:farmer/constants/constants.dart';
import 'package:farmer/models/plants.dart';
import 'package:farmer/ui/screens/scan_page.dart';
import 'package:farmer/ui/screens/cart_page.dart';
import 'package:farmer/ui/screens/favorite_page.dart';
import 'package:farmer/ui/screens/farmer_home_page.dart';
import 'package:farmer/ui/screens/farmer_profile_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../menu_bar/help_support.dart';
import '../menu_bar/terms_condition.dart';



class FarmerRootPage extends StatefulWidget {
  const FarmerRootPage({Key? key}) : super(key: key);

  @override
  State<FarmerRootPage> createState() => _FarmerRootPageState();
}

class _FarmerRootPageState extends State<FarmerRootPage> {

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const FarmerHomePage(),
      const FarmerProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider1>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffe1f6cb),
        actions: [
          PopupMenuButton(
            offset: Offset(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.grey), // Add a border if needed
            ),
            color: Color(0xffe1f6cb),
            icon: Icon(Icons.settings),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  title: Text('Notification Preferences'),
                  onTap: () {
                    // Add your action for setting 1
                    Navigator.pop(context);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text('Help and Support'),
                  onTap: () {
                    // Add your action for setting 3
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpSuppPage(),
                      ),
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text('App Version'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('App Version'),
                          content: Text('Your app version Runtime version: 17.0.9+0--11185874 amd64'),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text('Terms of Services and Privacy Policy'),
                  onTap: () {
                    // Add your action for setting 3
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsConditionPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnrollerPage(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            Icon(Icons.notifications, color: Constants.blackColor, size: 30.0,)
          ],
        ),
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index){
            setState(() {
              _bottomNavIndex = index;
            });
          }
      ),
    );
  }
}
