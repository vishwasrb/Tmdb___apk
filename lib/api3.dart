// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:mydemo_app/similermodel.dart';

// class Api3 {
//   static const String _baseUrl = 'https://api.themoviedb.org/3';
//   static const String _apiKey = '51aea399b9d14243d71178ac2ef551a2';

//   Future<Similarmodel> getSimilar(int movieId) async {
//     try {
//       final url = Uri.parse('$_baseUrl/movie/$movieId/movie_credits');
//       final response = await http.get(url.replace(queryParameters: {
//         'api_key': _apiKey,
//         'include_adult': 'false',
//         'language': 'en-US',
//       }));
//       if (response.statusCode == 200) {
//         print("sucesss");
//         return Similarmodel.fromJson(jsonDecode(response.body));
//       } else {
//         throw Exception('Failed to load data: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception("user errror");
//     }
//   }
// }
