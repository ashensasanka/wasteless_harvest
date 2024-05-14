import 'package:farmer/ui/market_palce_buyer/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';

class ShopPage extends StatefulWidget {
  final String username;
  const ShopPage({super.key, required this.username});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return RefreshIndicator(
          onRefresh: () async {
            ctrl.fetchallListings();
          },
          child: Scaffold(
            backgroundColor: Color(0xfff2f6df),
            appBar: AppBar(
              title: Text('Listings'),
              // Add leading back button to navigate to the HomePage
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.77,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemCount: ctrl.farmerlistingsShowInUi.length,
                      itemBuilder: (context, index) {
                        return ShopCard(
                          hbid:widget.username,
                          collName:ctrl.farmerlistingsShowInUi[index].collName ?? '',
                          owndocID:ctrl.farmerlistingsShowInUi[index].ownid ?? '',
                          alldocID:ctrl.farmerlistingsShowInUi[index].allid ?? '',
                          index: index,
                          name: ctrl.farmerlistingsShowInUi[index].name ??
                              'No name',
                          type: ctrl.farmerlistingsShowInUi[index].type ??
                              'Na category',
                          imageUrl:
                              ctrl.farmerlistingsShowInUi[index].image ?? 'url',
                          price: ctrl.farmerlistingsShowInUi[index].hbid ?? 00,
                          date: ctrl.farmerlistingsShowInUi[index].date ?? '',
                          amount:
                              ctrl.farmerlistingsShowInUi[index].amount ?? 00,
                          onTap: () {
                            // Get.to(const ProductDescriptionPage(), arguments: {'data':ctrl.productShowInUi[index]});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
