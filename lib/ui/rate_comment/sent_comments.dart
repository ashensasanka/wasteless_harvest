// import 'package:fishnetlk/controller/home_controller.dart';
// import 'package:fishnetlk/features/chat/presentation/widgets/message_contents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../controller/home_controller.dart';
import '../../features/chat/presentation/widgets/message_contents.dart';
import '../../model/user1_comment/user1_comment.dart';
import 'comment_contents.dart';
// import '/core/constants/app_colors.dart';

class SentComment extends StatelessWidget {
  final String message;

  const SentComment({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 15),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: Wrap(
                  children: [
                    CommentContents(
                      message: message,
                      isSentMessage: true,
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
