import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:farmer/ui/screens/buyer_profile_page.dart';
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



class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const FarmerHomePage(username: '',),
      const BuyerProfilePage(username: '',),
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
        actions: [
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
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings),
          )
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
        backgroundColor: Color(0xfff2f6df),
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
        inactiveColor: Colors.black.withOpacity(.7),
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
