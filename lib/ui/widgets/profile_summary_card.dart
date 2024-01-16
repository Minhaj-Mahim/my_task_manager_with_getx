import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task_manager_with_getx/ui/controllers/auth_controller.dart';
import 'package:my_task_manager_with_getx/ui/screens/edit_profile_screen.dart';
import 'package:my_task_manager_with_getx/ui/screens/login_screen.dart';


class ProfileSummeryCard extends StatefulWidget {
  final bool onTapStatus;

  const ProfileSummeryCard({
    super.key,
    this.onTapStatus = true,
  });

  @override
  State<ProfileSummeryCard> createState() => _ProfileSummeryCardState();
}

class _ProfileSummeryCardState extends State<ProfileSummeryCard> {
  String imageFormat = Get.find<AuthController>().user?.photo ?? '';

  @override
  Widget build(BuildContext context) {
    if (imageFormat.startsWith('data:image')) {
      imageFormat =
          imageFormat.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
    }
    return GetBuilder<AuthController>(
      builder: (authController) {
        Uint8List imageInBytes = const Base64Decoder().convert(imageFormat);
        return ListTile(
          onTap: () {
            if (widget.onTapStatus == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfileScreen()),
              );
            }
          },
          leading: Visibility(
            visible: imageInBytes.isNotEmpty,
            replacement: const CircleAvatar(
              backgroundColor: Colors.lightGreen,
              child: Icon(Icons.account_circle_outlined),
            ),
            child: CircleAvatar(
              backgroundImage: Image.memory(
                imageInBytes,
                fit: BoxFit.cover,
              ).image,
              backgroundColor: Colors.lightGreen,
            ),
          ),
          title: Text(
            userFullName(authController),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            authController.user?.email ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: IconButton(
            onPressed: () async {
              await AuthController.clearAuthData();
              Get.offAll(const LoginScreen());
            },
            icon: const Icon(Icons.logout, color: Colors.red,),
          ),
        );
      }
    );
  }

  String userFullName(AuthController authController) {
    return '${authController.user?.firstName ?? ''} ${authController.user?.lastName ?? ''}';
  }
}