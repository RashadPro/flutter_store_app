import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';

void main() async {
  GetAllProductService getAll = GetAllProductService();

  try {
    // Await the result of the asynchronous function
    List<ProductModel> products = await getAll.getAllProducts();

    // Print each product's details
    for (var product in products) {
      print('ID: ${product.id}');
      print('Title: ${product.title}');
      print('Price: ${product.price}');
      print('Description: ${product.description}');
      print('Category: ${product.category}');
      print('Image: ${product.image}');
      print('---');
    }
  } catch (e) {
    print('Error fetching products: $e');
  }
}
