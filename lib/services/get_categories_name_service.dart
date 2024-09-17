import 'package:store_app/helper/api_service.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoriesNameService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> products = await ApiService()
        .get(url: 'akestoreapi.com/products/category/$categoryName');

    List<ProductModel> productsList = [];
    for (var product in products) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}
