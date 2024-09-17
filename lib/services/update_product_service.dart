import 'package:store_app/models/product_model.dart';
import '../helper/api_service.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required int id,
  }) async {
    dynamic data = await ApiService()
        .put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    print(data);
    return ProductModel.fromJson(data);
  }
}
