import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/provider/app_provider.dart';
import 'package:smart_shopy/widgets/primary_button/primary_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  takePicture() async {
    XFile? value = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    if (value != null) {
      setState(
        () {
          image = File(value.path);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: editProfile.text.fontFamily(bold).size(23).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            CircleAvatar(
              backgroundColor: redColor,
              radius: 70,
              child: image == null
                  ? const Icon(
                      Icons.camera_alt,
                      color: whiteColor,
                    ).onTap(
                      () {
                        takePicture();
                      },
                    )
                  : Image.file(
                      image!,
                      fit: BoxFit.fill,
                    ),
            ),
            12.heightBox,
            TextFormField(
              decoration: const InputDecoration(
                // hintText: appProvider.getUserInfo.name,
                hintText: 'Abhimanya',
              ),
            ),
            12.heightBox,
            TextFormField(
              decoration: const InputDecoration(
                // hintText: appProvider.getUserInfo.email,
                hintText: 'abhimanya07@gmail.com',
              ),
            ),
            20.heightBox,
            PrimaryButton(
              onPressed: () async {
                // String imageUrl = await FirebaseStorageHelper.instance
                //     .uploadUserImage(image!);
                // print("xfxhgcghcghgvjhfhfghgc");
                // print(imageUrl);
              },
              title: 'Update',
            )
          ],
        ),
      ),
    );
  }
}
