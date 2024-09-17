import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/text_from_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = 'Update Product';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image, price;

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update Product',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFromField(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: "Product Name",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFromField(
                    onChanged: (data) {
                      price = data;
                    },
                    inputType: TextInputType.number,
                    hintText: "Price",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFromField(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: "description",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFromField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: "Image",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: "Update Product",
                    onTap: () async {
                      // isLoding = true;
                      setState(() {});
                      try {
                        await updateProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Product data updated"),
                          ),
                        );
                        isLoding = false;
                      } catch (e) {
                        print(e.toString());
                        isLoding = false;
                        setState(() {});
                      }
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
