import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/meal_model.dart';
import '../model/postmodel.dart';

Future<List<Comments>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Comments.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
Future<Map<String, dynamic>> getUserData()async{
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  final jsonResponse = jsonDecode(response.body);
  print(jsonResponse.runtimeType);
  return jsonResponse;
}
Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}