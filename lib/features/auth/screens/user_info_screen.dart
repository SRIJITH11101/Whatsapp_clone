import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/commons/utils/utils.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});
  static const String routeName = "/user-info";

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
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
                onPressed: () {},
                icon: Icon(Icons.done),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
