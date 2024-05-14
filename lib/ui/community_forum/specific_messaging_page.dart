import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants_articles.dart';
import '../../constants/round_icon_button.dart';
import '../../controller/home_controller.dart';
import '../../features/chat/presentation/widgets/chat_tile.dart';
import '../../features/chat/presentation/widgets/my_profile_pic.dart';

class SpecificMessagePage extends StatefulWidget {
  static const routeName = '/specific-messaging-page';

  const SpecificMessagePage({super.key});

  @override
  State<SpecificMessagePage> createState() => _SpecificMessagePageState();
}

class _SpecificMessagePageState extends State<SpecificMessagePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: AppColors.realWhiteColor,
          appBar: AppBar(
            title: Text('Specific Messaging'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: Constants.defaultPadding,
              child: Column(
                children: [
                  //             // build chats app bar
                  _buildChatsAppBar(),
                  const SizedBox(height: 20),
                  //             // Search widget
                  _buildChatsSearchWidget(),
                  const SizedBox(height: 30),
                  //             // Chats List
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 4.5,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemCount: ctrl.usersShow.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 70,
                          child: ChatTile(
                            userId: '',
                            lastMessage: 'chat.lastMessage',
                            lastMessageTs: DateTime(2017, 9, 7, 17, 30),
                            chatroomId: 'chat.chatroomId',
                            index: index,
                          ),
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

  Widget _buildChatsAppBar() =>
      Row(
        children: [
          const MyProfilePic(),
          const SizedBox(width: 5),
          const Text(
            'Chats',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _buildChatsSearchWidget() =>
      Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            Icon(Icons.search),
            SizedBox(width: 15),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      );
}
