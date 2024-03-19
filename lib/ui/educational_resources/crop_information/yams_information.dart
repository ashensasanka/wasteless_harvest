import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/details_card.dart';
import '../../widgets/details_description_page.dart';

class YamsPage extends StatefulWidget {
  const YamsPage({super.key});

  @override
  State<YamsPage> createState() => _YamsPageState();
}

class _YamsPageState extends State<YamsPage> {
  final List<Map<String, dynamic>> users = [
    {'name': 'Potato', 'imageurl': 'assets/images/potato.png', 'description':'Potato is belong to solanacea family. It was introduced to Sri Lanka by Samuel Baker in 1850. Large Scale cultivation of potato was started by Department of Agriculture in Rahangala farm but it was failed due to bacterial wilt. Farmers multiply potato seeds on land in higher elevation for producing seeds for the major cultivation season (Yala season)'},
    {'name': 'Beet', 'imageurl': 'assets/images/beet.png', 'description':'Beet are grown well in cool temperature of up country area. It can be grown well in all the agro-ecological zones.It requires well drain soil with adequate amount of organic matter. Optimum soil pH range is 6.3- 7.3.Add well decomposed organic manure to the raised beds. It is important to sterilization of the soil using fungicide, solar or burning paddy straws. Seeds are established in 10 cm apart rows.'},
    {'name': 'Carrot', 'imageurl': 'assets/images/carrot.png', 'description':'Carrot can be grown well in cool area of up country regions. It can be cultivated in all the agro-ecological zones.It need a finely prepared well drain soil with more organic matter.Plough up to depth of 30 cm and finely prepare soil before planning. Seed are plating on one-meter width raised beds.'},
    {'name': 'Cassava', 'imageurl': 'assets/images/cassava.png', 'description':'Good starchy food source. Considerable amount of calcium, Phosphorus and vitamin C is rich in roots. Use as staple food as well as chips, alcohol and fuel productivity. Comparatively low water and nutrient requirement. Therefore thrive well in marginal lands.'},
    {'name': 'Innala', 'imageurl': 'assets/images/innala.jpg', 'description':'Year around rainfall distribution is better. High day and night temperature gap is important for tuber formationMost suitable growing areas – wet zone specially Galle, Kalutara, Colombo, Gampaha, Matale, Matara, Rathnapura districtsIn addition Kurunegala from intermediate zone and Hambantota from dry zone (Minor)'},
    {'name': 'Kiri Ala', 'imageurl': 'assets/images/kiriala.jpg', 'description':'High Nutritious value crop. Under irrigation condition cultivate throughout the year. This is economically profitable as it can be cultivated with low inputs marginal lands with low risk.'},
    {'name': 'Kohila', 'imageurl': 'assets/images/kohila.png', 'description':'Kohila leaves and rhizomes are popular and nutritious foods. It is good for hemorrhoids and stomach aches as it is rich in fiber.Only in places where the soil is frequently waterlogged. Kohila is a suitable crop for wetlands. Therefore, it is advisable to have shade for this crop. When there is no shade, the leaves are small.'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xffe1f6cb),
          title: Text('Yams'),
          // Add leading back button to navigate to HomePage
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.9,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            return DetailsCard(
              index: index,
              name: users[index]['name'] ?? '',
              imageUrl: users[index]['imageurl'] ?? '',
              onTap: () {
                Get.to(const DescriptionPage(), arguments: {'data': users[index]});
              },
            );
          },
        )
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Yams'),
    //     // Add leading back button to navigate to HomePage
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back),
    //       onPressed: () {
    //         Navigator.of(context).pop();
    //       },
    //     ),
    //   ),
    //   body: Container(
    //     color: Color(0xffe1f6cb),
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Text(
    //               'Potato',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/potato.png',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               '',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //             // Add more vegetable descriptions here
    //             Text(
    //               'Beet',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/beet.png',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               '',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //
    //             Text(
    //               'Carrot',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/carrot.png',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               'Carrot can be grown well in cool area of up country regions. It can be cultivated in all the agro-ecological zones.It need a finely prepared well drain soil with more organic matter.Plough up to depth of 30 cm and finely prepare soil before planning. Seed are plating on one-meter width raised beds.',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //
    //             Text(
    //               '',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/.png',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               '',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //
    //             Text(
    //               'Sweet Potato',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/.png',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               '',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //
    //             Text(
    //               'Innala',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/innala.jpg',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               '',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //
    //             Text(
    //               '',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/.jpg',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               '',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //
    //             Text(
    //               '',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/.png',
    //               height: 200,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               '',
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //             Divider(thickness: 3,color: Colors.black,),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
