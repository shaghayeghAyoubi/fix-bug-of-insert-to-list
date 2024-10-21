import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/image_controller.dart';

class ImageListScreen extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());

  ImageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Image List'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: imageController.images.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.memory(imageController.images[index].imageBytes),
              title: Text('Image ${index + 1}'),
            );
          },
        ),
      ),
    );
  }
}
