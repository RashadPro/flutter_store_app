import 'package:store_app/helper/api_service.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      List<dynamic> products =
          await ApiService().get(url: 'https://fakestoreapi.com/products');
      List<ProductModel> productsList = [];

      for (var product in products) {
        productsList.add(ProductModel.fromJson(product));
      }

      return productsList;
    } catch (e) {
      // Handle the exception, log it, or rethrow it
      print('Error fetching products: $e');
      return [];
    }
  }
}
