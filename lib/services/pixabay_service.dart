import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class PixabayService {
  final String _apiKey = '46274744-15dd5369e312672304b1e7e19';

  Future<List<ImageModel>> fetchImages(int page) async {
    final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=$_apiKey&image_type=photo&per_page=20&page=$page',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['hits'];
      return data.map<ImageModel>((json) => ImageModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
