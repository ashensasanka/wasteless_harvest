import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import 'my_card.dart';

class MyCropsPage extends StatefulWidget {
  final String username;
  const MyCropsPage({super.key, required this.username});

  @override
  State<MyCropsPage> createState() => _MyCropsPageState();
}

class _MyCropsPageState extends State<MyCropsPage> {
  @override
  Widget build(BuildContext context) =>
      GetBuilder<HomeController>(builder:(ctrl) {
        return RefreshIndicator(
          onRefresh: () async{
            ctrl.fetchListingDetails(widget.username);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor:Color(0xffe1f6cb),
              title: Text('My Crops'),
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
                                childAspectRatio: 1.8,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                            itemCount: ctrl.listingsShowInUi.length,
                            itemBuilder: (context, index) {
                              return MyCard(
                                index: index,
                                type: ctrl.listingsShowInUi[index].type ?? 'Na category',
                                name: ctrl.listingsShowInUi[index].name ?? 'No name',
                                imageUrl: ctrl.listingsShowInUi[index].image ?? 'url',
                                plant_date:ctrl.listingsShowInUi[index].plant_date ?? '',
                                harvest_date:ctrl.listingsShowInUi[index].harvest_date ?? '',
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
