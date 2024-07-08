import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'base.dart';
import 'package:shop/src/model/product.dart';
import 'package:http/http.dart' as http;

Future<Product> getProduct(int productId) async {
  final response = await http.get(
    Uri.parse(URI_PRODUCT + (productId != 0 ? "&productId=$productId" : '')),
    headers: {
      HttpHeaders.authorizationHeader: KEY,
    },
  );

  if (response.statusCode == 200) {
    var first = jsonDecode(response.body)['data'];
    return Product.fromJson(first);
  } else {
    throw Exception('Failed to load Product List !!! ');
  }
}
