import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/product_model.dart';
import '../services/products_service.dart';

class ProductsController {
  final ProductsService _productsService;

  ProductsController(this._productsService);

  FutureOr<Response> getAllProducts(Request request) async {
    try {
      final List<ProductModel> allProducts =
          await _productsService.findAllproducts();
      return Response.ok(
          jsonEncode({
            'products': allProducts.map((product) => product.toMap()).toList(),
          }),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    } catch (e) {
      return Response.internalServerError(
          body: jsonEncode({'error': e.toString()}));
    }
  }

  FutureOr<Response> getProductById(Request request) async {
    final int productId = int.parse(request.params['id']!);
    try {
      final ProductModel product =
          await _productsService.findProductById(productId);
      return Response.ok(
          jsonEncode({
            'product': product.toMap(),
          }),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    } catch (e) {
      return Response.internalServerError(
          body: jsonEncode({'error': e.toString()}));
    }
  }

  FutureOr<Response> createProduct(Request request) async {
    final String body = await request.readAsString();
    final Map<String, dynamic> productData = jsonDecode(body);
    final ProductModel newProduct = ProductModel.fromMap(productData);

    try {
      final result = await _productsService.createProduct(newProduct);
      return Response(201,
          body: jsonEncode({
            'products': result.toMap(),
          }),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    } catch (e) {
      return Response.internalServerError(
          body: jsonEncode({'error': e.toString()}));
    }
  }
}
