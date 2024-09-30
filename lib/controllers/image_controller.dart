import 'package:get/get.dart';
import '../models/image_model.dart';
import '../services/pixabay_service.dart';

class ImageController extends GetxController {
  var images = <ImageModel>[].obs;
  var isLoading = false.obs;
  var currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    isLoading(true);
    List<ImageModel> newImages = await PixabayService().fetchImages(currentPage);
    images.addAll(newImages);
    isLoading(false);
    currentPage++;
  }
}
