import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/pre_register/controller/PreRegisterController.dart';

import '../../../config/constanent.dart';

class ImageUpload extends StatelessWidget {
  PreRegisterController controller =
  Get.put<PreRegisterController>(PreRegisterController());

  ImageUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreRegisterController>(
        init: PreRegisterController(),
        builder: (controller) {
          Uint8List bytes = base64.decode(controller.base64Image);
          return Column(
            children: [
              // Display the image if available
              SizedBox(
                height: controller.base64Image.isNotEmpty ? 160 : 0,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                    child: Image.memory(
                      bytes,
                      fit: BoxFit.cover,
                      height: 160,
                    ),
                  ),
                ),
              ),
              // Upload button
              InkWell(
                onTap: () {
                  // Directly open the front camera
                  controller.getCameraImage(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.cyan[200],
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        color: primaryColor,
                      ),
                      const SizedBox(width: defaultPadding / 2),
                      Text(
                        'Upload Image'.toUpperCase(),
                        style: const TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
