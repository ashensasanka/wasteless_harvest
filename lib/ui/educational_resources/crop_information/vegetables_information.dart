import 'package:farmer/ui/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/details_description_page.dart';

class VegetablePage extends StatefulWidget {
  const VegetablePage({Key? key}) : super(key: key);

  @override
  State<VegetablePage> createState() => _VegetablePageState();
}

class _VegetablePageState extends State<VegetablePage> {
  final List<Map<String, dynamic>> users = [
    {'name': 'Cabbage', 'imageurl': 'assets/images/cabbage.png', 'description':'For nurseries, 1 x 3 m size, 15 cm height raised beds are necessary. Add media (compost: top soil- 1:1 ratio mixture) to the nursery bed up to 5-8 cm. Established seed in 10 cm apart rows to the depth of 1 cm. Cover the seed using sterilized soil and mulch over the bed. Remove mulch after seedling are germinated.'},
    {'name': 'Radish', 'imageurl': 'assets/images/radish.png', 'description':'Radish can be grown in all agro-ecological regions in the country.Well-drained soils are suitable, poorly drained soils can cause growth problems. A pH range of 6.0 – 7.5 is appropriate for cultivation.Soils should be ploughed to a depth of 30-40 cm to provide the necessary depth and fine tilth.'},
    {'name': 'Carrot', 'imageurl': 'assets/images/carrot.png', 'description':'Carrot can be grown well in cool area of up country regions. It can be cultivated in all the agro-ecological zones.It need a finely prepared well drain soil with more organic matter.Plough up to depth of 30 cm and finely prepare soil before planning. Seed are plating on one-meter width raised beds.'},
    {'name': 'Tomato', 'imageurl': 'assets/images/tomato.png', 'description':'Although Tomato is moderately tolerant to a wide range of pH, it grows well in soils with a pH of 5.5-7.5.  Addition of organic matter is favorable for a better growth.Suitable period for nursery establishment is mid of March or end of August. 1 m x 3 m size raised bed (about 15-20 cm raised) is recommended. Remove clods of earth and stubble. Mix well decomposed farmyard manure and top soil 1:1 ratio and lay on the bed to 5cm thickness.'},
    {'name': 'Capsicum', 'imageurl': 'assets/images/cappsicum.png', 'description':'This is a popular vegetable in Sri Lanka. It is grow mostly in dry and intermediate zones. About 4000ha is cultivated annually and supply about 36000 mt. the per capita consumption is about 890g. the local need is satisfied with the local production. This crop is cultivated in all the districts during both yala and maha seasons. This is cultivated in all months of the year in different parts of the country. NuwaraEliya, Badulla, Kurunegala, Puttalam and Anuradhapura are major cultivated districts.'},
    {'name': 'Brinjal', 'imageurl': 'assets/images/brinjal.png', 'description':'Crop can be grown up to 1300 m above sea level.Well drained soil is suitable, pH range from 5.5 – 5.8.3m x 1m beds in better sunlight conditions are suitable. Beds should be sterilized. Add 1:1 ratio of surface soil and cow dung. Seeds should be placed in rows in 6 inches spacing.'},
    {'name': 'Okra', 'imageurl': 'assets/images/okra.png', 'description':'At present it is cultivated successfully in Hambanthota, Kurunegala, Rathnapura and Mathale districts and spreading into Anuradhapura, puttalam. Mathara, Badulla and Moneragala districts. Consumes young pods, but leaves are a delicacy in India and Africa. Nutrient level is very high, fibres, minerals, especially calcium and Iodine are presence in immature pods. Okra plays an important role in controlling thyroxine related disease since calcium and iodine availability is high.'},
    {'name': 'Bean', 'imageurl': 'assets/images/beans.png', 'description':'Bean belongs to the family Fabaceae and Genus Phaseolus.  It is widely cultivated in Badulla, Nuwara Eliya, Matale and Kandy Districts. Areas with high temperature (>32 ⁰C) and continuous high rainfall is unsuitable for bean cultivation. Temperature should be less than 30⁰C at the time of flowering because high temperature adversely effect on flowering and pod setting. Although bean is mainly cultivated in Up Country Intermediate Zone, it can also be cultivated in Up Country Wet Zone.'}
  ];
  List<Map<String, dynamic>> filteredUsers = []; // Add filtered users list
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    filteredUsers = users; // Initialize filtered users list with all users
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffe1f6cb),
        title: Text('Vegetables'),
        // Add leading back button to navigate to HomePage
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Clear the previous search results when the search icon is tapped
              searchController.clear();
              setState(() {
                filteredUsers = users;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                // Filter the users based on the search query
                setState(() {
                  filteredUsers = users.where((user) =>
                      user['name'].toString().toLowerCase().contains(value.toLowerCase())).toList();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.9,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return DetailsCard(
                  index: index,
                  name: filteredUsers[index]['name'] ?? '',
                  imageUrl: filteredUsers[index]['imageurl'] ?? '',
                  onTap: () {
                    Get.to(const DescriptionPage(), arguments: {'data': filteredUsers[index]});
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
