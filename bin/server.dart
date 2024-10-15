import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../src/controllers/products_controller.dart';
import '../src/services/products_service.dart';

final _router = Router();

void main() async {
  final ProductsService productsService = ProductsService();
  final ProductsController productsController =
      ProductsController(productsService);

  _router.get('/products', productsController.getAllProducts);
  _router.get('/products/<id>', productsController.getProductById);
  _router.post('/products', productsController.createProduct);

  final ip = InternetAddress.anyIPv4;
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
