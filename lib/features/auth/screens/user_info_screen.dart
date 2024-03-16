import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/commons/utils/utils.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  const UserInfoScreen({super.key});
  static const String routeName = "/user-info";

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref
          .read(AuthControllerProvider)
          .saveUserDataToFirebase(context, name, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              image == null
                  ? CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          'https://w7.pngwing.com/pngs/129/292/png-transparent-female-avatar-girl-face-woman-user-flat-classy-users-icon-thumbnail.png'),
                    )
                  : CircleAvatar(
                      radius: 70,
                      backgroundImage: FileImage(image!),
                    ),
              Positioned(
                bottom: -10,
                left: 90,
                child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(
                    Icons.add_a_photo,
                    size: 25,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.85,
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Enter your name'),
                ),
              ),
              IconButton(
                onPressed: storeUserData,
                icon: Icon(Icons.done),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
