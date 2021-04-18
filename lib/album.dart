// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Album {
//   final String id;
//   final String name;
//   Album({this.id, this.name});
//   factory Album.fromJson(Map<String, dynamic> json) {
//     for (var item in json['data']) {
//       return Album(
//         id: item['_id'],
//         name: item['name'],
//       );
//     }
//     return null;
//   }
// }

// Future<Album> fetchAlbum() async {
//   final url = Uri.tryParse('https://phukien.appspot.com/api/categories');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
