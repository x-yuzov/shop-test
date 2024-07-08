import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'base.dart';
import 'package:shop/src/model/product_list.dart';
import 'package:http/http.dart' as http;

Future<List<ProductList>> getList(int categoryId) async {
  final response = await http.get(
    Uri.parse(URI_LIST + (categoryId != 0 ? "&categoryId=$categoryId" : '')),
    headers: {
      HttpHeaders.authorizationHeader: KEY,
    },
  );

  if (response.statusCode == 200) {
    var first = jsonDecode(response.body)['data'] as List<dynamic>;

    List<ProductList> listObjs =
        first.map((json) => ProductList.fromJson(json)).toList();
    return listObjs;
  } else {
    throw Exception('Failed to load Product List !!! ');
  }
}
