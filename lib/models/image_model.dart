class ImageModel {
  final String url;
  final int likes;
  final int views;

  ImageModel({required this.url, required this.likes, required this.views});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['webformatURL'],
      likes: json['likes'],
      views: json['views'],
    );
  }
}
