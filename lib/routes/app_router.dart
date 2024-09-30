import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/image_gallery.dart';
import '../views/image_detail.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetPageRoute(page: () => ImageGallery());
      case '/detail':
        return GetPageRoute(page: () => ImageDetail.fromRouteArguments(settings.arguments));
      default:
        return GetPageRoute(page: () => ImageGallery());
    }
  }
}
