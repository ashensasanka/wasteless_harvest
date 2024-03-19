// import 'package:fishnetlk/controller/home_controller.dart';
// import 'package:fishnetlk/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../constants/app_colors.dart';
import '../../../../controller/home_controller.dart';

class ChatUserInfo extends StatelessWidget {
  const ChatUserInfo({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(builder:(ctrl) {
        return Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'
                  // ctrl.makePostUi[1].image as String
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ashen Sasanka',
                  // ctrl.makePostUi[1].fullName as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Text(
                  'Messenger',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}