
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/home_controller.dart';
import 'bid_card.dart';

class BidsWonPage extends StatefulWidget {
  const BidsWonPage({super.key});

  @override
  State<BidsWonPage> createState() => _BidsWonPageState();
}

class _BidsWonPageState extends State<BidsWonPage> {
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl){
      return RefreshIndicator(
        onRefresh: () async{
          ctrl.fetchMycrops('');
        },
        child: Scaffold(
          backgroundColor: Color(0xfff2f6df),
          appBar: AppBar(
            title: Text('Won Bids'),
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
                const SizedBox(height: 15,),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.8,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemCount: ctrl.listingsShowInUi.length,
                      itemBuilder: (context, index) {
                        return BidCard(
                          index: index,
                          type:ctrl.listingsShowInUi[index].type ?? '',
                          name: ctrl.listingsShowInUi[index].name ?? 'No name',
                          imageUrl: ctrl.listingsShowInUi[index].image ?? 'url',
                          offerTag: '',
                          onTap: () {
                            // Get.to(const ProductDescriptionPage(), arguments: {'data':ctrl.productShowInUi[index]});
                          },);
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
