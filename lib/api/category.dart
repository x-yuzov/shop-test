import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'base.dart';
import 'package:shop/src/model/category.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> getCat() async {
  final response = await http.get(
    Uri.parse(URI_CAT),
    headers: {
      HttpHeaders.authorizationHeader: KEY,
    },
  );

  if (response.statusCode == 200) {
    var first =
        jsonDecode(response.body)['data']['categories'] as List<dynamic>;
    List<Category> catObjs =
        first.map((json) => Category.fromJson(json)).toList();
    return catObjs;
  } else {
    throw Exception('Failed to load Categories !!! ');
  }
}


