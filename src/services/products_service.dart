import '../data/fake_data.dart';
import '../models/product_model.dart';

class ProductsService {
  Future<List<ProductModel>> findAllproducts() async {
    await Future.delayed(Duration(seconds: 1));

    final List<ProductModel> allProducts =
        products.map((product) => ProductModel.fromMap(product)).toList();

    return allProducts;
  }

  Future<ProductModel> findProductById(int id) async {
    await Future.delayed(Duration(seconds: 1));

    final List<ProductModel> allProducts =
        products.map((product) => ProductModel.fromMap(product)).toList();

    final selectedProduct =
        allProducts.firstWhere((product) => product.id == id);

    return selectedProduct;
  }

  Future<ProductModel> createProduct(ProductModel product) async {
    await Future.delayed(Duration(seconds: 1));

    final Map<String, dynamic> newProduct = product.toMap();
    products.add(newProduct);

    return ProductModel.fromMap(newProduct);
  }
}
