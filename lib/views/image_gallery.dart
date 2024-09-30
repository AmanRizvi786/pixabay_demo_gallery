import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/image_controller.dart';
import 'image_detail.dart';

class ImageGallery extends StatelessWidget {
  final ImageController controller = Get.put(ImageController());

  ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        // Show loading indicator while images are being fetched
        if (controller.isLoading.value && controller.images.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75, // Adjusts the ratio to suit card-like design
          ),
          itemCount: controller.images.length,
          itemBuilder: (context, index) {
            final image = controller.images[index];

            return GestureDetector(
              onTap: () {
                Get.to(() => ImageDetail(image: image));
              },
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image with rounded corners and elevation
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          image.url,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display likes with an icon
                          Row(
                            children: [
                              const Icon(Icons.thumb_up, color: Colors.purple, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                '${image.likes}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Display views with an icon
                          Row(
                            children: [
                              const Icon(Icons.visibility, color: Colors.purple, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                '${image.views}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
