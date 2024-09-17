import 'package:store_app/helper/api_service.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await ApiService()
        .get(url: 'https://fakestoreapi.com/products/categories');

    return categories;
  }
}
