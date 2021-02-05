import 'package:first_project/core/api/main_api.dart';
import 'package:first_project/core/model/product_model.dart';

class ProductApi extends MainApi {

  Future<List<Product>> loadProducts() async {
    try {
      final response = await getRequest(
        url: "$host/admin/products"
      );
      return productResponseFromJson(response).product;
    } catch (error) {
      throw error;
    }
  }

}