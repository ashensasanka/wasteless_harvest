import 'dart:io';
import 'package:farmer/ui/educational_resources/main/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/constants.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/utils.dart';
import '../../widgets/drop_down_btn.dart';
import '../../widgets/round_button.dart';
import 'articles_page.dart';
import 'image_video_view.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  static const routeName = '/create-post';

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {

  File? file;
  String fileType = 'image';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder: (ctrl){
      return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xffe1f6cb),
          title: const Text('Post an Article',
                        style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Container(
          height: 700,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: Constants.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const ProfileInfo(),
                  // post text field
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const SizedBox(width: 15,),
                      const Flexible(
                          child: Text('Article to',
                                      style: TextStyle(
                                          fontSize: 19,
                                      fontWeight: FontWeight.bold),
                          )
                      ),
                      const SizedBox(width: 30,),
                      Flexible(
                        child: DropDownBtn(
                          items: const ['Farmers', 'Buyers'],
                          selectedItemText: ctrl.from,
                          onSelected: (selectedValue) {
                            ctrl.from = selectedValue ?? 'To';
                            ctrl.update();
                          },
                        )),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Row(
                    children: [
                      SizedBox(width: 15,),
                      Text('Title',
                      style: TextStyle(fontSize: 22),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: ctrl.challengeTitleCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        label: const Text('Title Required'),
                        hintText: 'Enter Title'
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Row(
                    children: [
                      SizedBox(width: 15,),
                      Text('Email',
                        style: TextStyle(fontSize: 22),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: ctrl.challengeEmailCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        label: const Text('Email Required'),
                        hintText: 'Enter Email'
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: ctrl.challengeDescriptionCtrl,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 10,
                  ),
                  const SizedBox(height: 20),
                  file != null
                      ? ImageVideoView(
                    file: file!,
                    fileType: fileType,
                  )
                      : PickFileWidget(
                    pickImage: () async {
                      fileType = 'image';
                      file = await pickImagepost();
                      setState(() {});
                    },
                    pickVideo: () async {
                      fileType = 'video';
                      file = await pickVideopost();
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : RoundButton(
                    onPressed: () {
                          ctrl.fetchPostsList();
                          ctrl.addPost(file, fileType);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ArticlesPage()),
                          );
                    },
                    label: 'Post',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  );
}

class PickFileWidget extends StatelessWidget {
  const PickFileWidget({
    super.key,
    required this.pickImage,
    required this.pickVideo,
  });


  final VoidCallback pickImage;
  final VoidCallback pickVideo;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        const SizedBox(width: 50,),
        TextButton(
          onPressed: pickImage,
          child: const Text('Pick Image'),
        ),
        const SizedBox(width: 50,),
        TextButton(
          onPressed: pickVideo,
          child: const Text('Pick Video'),
        ),
      ],
    );
  }
}
