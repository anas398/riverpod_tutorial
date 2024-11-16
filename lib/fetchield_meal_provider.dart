
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reiverpod_tutorial/model/meal_model.dart';
import 'package:reiverpod_tutorial/serviece/apirepo.dart';

import 'model/postmodel.dart';

final userProvider = FutureProvider<List<Comments>>((ref) async {
  return fetchUsers();
});
final getUserProvider = FutureProvider<Map<String, dynamic>>((ref) async {
   return getUserData();
});
final postsProvider = FutureProvider<List<Post>>((ref) async {
  return fetchPosts();
});