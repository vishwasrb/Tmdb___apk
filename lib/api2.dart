import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mydemo_app/personmodel.dart';

class Api2 {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = '51aea399b9d14243d71178ac2ef551a2';

  Future<Personmodel> getsearchpeople(int personID) async {
    try {
      final url = Uri.parse('$_baseUrl/person/$personID');
      final response = await http.get(url.replace(queryParameters: {
        'api_key': _apiKey,
        'include_adult': 'false',
        'language': 'en-US',
        'page': '1',
      }));
      if (response.statusCode == 200) {
        print("sucesss");
        return Personmodel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("user errror");
    }
  }
}
