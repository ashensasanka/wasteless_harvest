import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import 'listing_card.dart';
import 'my_card.dart';

class MyListingPage extends StatefulWidget {
  final String username;
  const MyListingPage({super.key, required this.username});

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {
  @override
  Widget build(BuildContext context) =>
      GetBuilder<HomeController>(builder:(ctrl) {
        return RefreshIndicator(
          onRefresh: () async{
            ctrl.fetchfarmerListingDetails(widget.username);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor:Color(0xffe1f6cb),
              title: Text('My Listings'),
              // Add leading back button to navigate to HomePage
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/home_back.jpg', // Replace 'assets/background_image.jpg' with your image path
                    fit: BoxFit.cover,
                  ),
                ),
                // Content on top of the background image
                Container(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 2.2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                            itemCount: ctrl.farmerlistingsShowInUi.length,
                            itemBuilder: (context, index) {
                              return ListCard(
                                index: index,
                                type: ctrl.farmerlistingsShowInUi[index].type ?? 'Na category',
                                name: ctrl.farmerlistingsShowInUi[index].name ?? 'No name',
                                hbidname:'',
                                imageUrl: ctrl.farmerlistingsShowInUi[index].image ?? 'url',
                                amount: ctrl.farmerlistingsShowInUi[index].amount ?? 00,
                                hbid:ctrl.farmerlistingsShowInUi[index].hbid ?? 0,
                                date:ctrl.farmerlistingsShowInUi[index].date ?? '',
                                onTap: () {
                                  // Get.to(const ProductDescriptionPage(), arguments: {'data':ctrl.productShowInUi[index]});
                                },);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
