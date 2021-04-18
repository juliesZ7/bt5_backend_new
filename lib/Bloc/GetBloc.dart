// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class AlbumBloc {
//   final int id;
//   final String name;
//   AlbumBloc({this.id, this.name});
//   // sau khi gọi fromJson ở dưới nó sẽ chạy vô thằng này để truyền giá trị
//   factory AlbumBloc.fromJson(Map<String, dynamic> json) {
//     return AlbumBloc(id: json['id'], name: json['name']);
//     //trả về 1 AlbumBloc
//   }
// }

// List<AlbumBloc> list = [];
// StreamController<List<AlbumBloc>> streamController = StreamController();
// Sink get albumSink => streamController.sink;
// Stream get albumStream => streamController.stream;
// //khai báo trả về luôn là 1 list<model> vì nếu trả về 1 model thì lấy từng phần tử từ json luôn cho rồi chứ khỏi cần tạo model
// Future<List<AlbumBloc>> fetchAlbum() async {
//   final url =
//       Uri.tryParse('https://jsonplaceholder.typicode.com/posts/1/comments');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     //response.body trả về json
//     var jsonReponse = jsonDecode(response.body);
//     //jsonReponse trả về 1 List<dynamic> cụ thể là List<json của AlbumBloc>
//     for (var val in jsonReponse) {
//       //mỗi val ở đây tương ứng với một json trong jsonReponse tương ứng
//       //vì val = json của AlbumBloc nên ta đưa cái json dó vào function fromJson của AlbumBloc để truyền dữ liệu cho AlbumBloc
//       list.add(AlbumBloc.fromJson(val));
//       albumSink.add(list);
//       //theo vòng for sẽ chuyển hết cái List<dynamic> thành List<AlbumBloc>
//     }
//     //trả về đúng dạng đã khai báo ở trên
//     return Future.value(list);
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
