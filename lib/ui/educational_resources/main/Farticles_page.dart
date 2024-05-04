import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/constants_articles.dart';
import '../../../constants/round_icon_button.dart';

class FArticlesPage extends StatefulWidget {
  const FArticlesPage({super.key});

  @override
  State<FArticlesPage> createState() => _FArticlesPageState();
}

class _FArticlesPageState extends State<FArticlesPage> with TickerProviderStateMixin{
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Color(0xFFC9CCD3),
        appBar: AppBar(
          title: buildArticleText(),
          actions: [
            // built the actions
            _buildSearchWidget(),
          ],
          bottom: TabBar(
            tabs: Constants.getHomeScreenTabs(_tabController.index),
            controller: _tabController,
            onTap: (index) {
              setState(() {});
            },
          ),
          // Add leading back button to navigate to HomePage
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: Constants.fscreens,
        ),
      ),
    );
  }
  // App bar title
  Widget buildArticleText() => const Text(
    'Articles',
    style: TextStyle(
      color: Color(0xFF378BF7),
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget _buildSearchWidget() => const RoundIconButton(
    icon: FontAwesomeIcons.magnifyingGlass,
  );
}
