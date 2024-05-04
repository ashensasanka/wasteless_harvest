// import 'package:fishnetlk/features/chat/presentation/widgets/sent_message.dart';
import 'package:farmer/features/chat/presentation/widgets/sent_message.dart';
import 'package:farmer/ui/rate_comment/sent_comments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home_controller.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return ListView.builder(
          reverse: true, // Set reverse to true
          itemCount: ctrl.user1commentUi.length,
          itemBuilder: (context, index) {
            // Calculate the reversed index
            int reversedIndex = ctrl.user1commentUi.length - 1 - index;
            return Container(
              width: 100,
              height: 120,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.radio_button_checked_outlined),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerLeft, // Align to the start
                        child: Text("${ctrl.user1commentUi[index].name}"),
                      ),
                    ],
                  ),
                  SentComment(message: ctrl.user1commentUi[reversedIndex].message as String),
                ],
              ),
            );
            // You may need to adjust the code based on your actual message structure
          },
        );
      },
    );
  }
}
