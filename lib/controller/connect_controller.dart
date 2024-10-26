
import 'dart:convert';

import 'package:get/get.dart';

import '../DataModel/products_model.dart';


class ConnectController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();
  late RxList<ProductModel?> data = <ProductModel>[].obs;
  Rx<ProductModel?> newProduct = Rx<ProductModel?>(null);
  RxInt prodId = RxInt(-1);


  @override
  void onInit() {
    super.onInit();
    _apiProvider.fetchProducts(data);
  }

  void addNewProduct() async {
    var data = {
      "title": 'test product',
      "price": 13.5,
      "description": 'lorem ipsum set',
      "image": 'https://i.pravatar.cc',
      "category": 'artificial',
    };
    // Update the newProduct value safely with the result from addProduct
    ProductModel? result = await _apiProvider.addProduct(data);
    if (result != null) {
      newProduct.value = result;
      prodId.value = result.id!;
    } else {
      throw Exception("Failed to add new product.");
    }
  }

  void updateProduct() async {
    var data = {
      "title": 'update product',
      "price": 15.5,
      "description": 'lorem ipsum',
      "image": 'https://i.pravatar.cc',
      "category": 'artificial',
    };
    ProductModel? result = await _apiProvider.updateProduct(data,prodId);
    if (result != null) {
      newProduct.value = result;
      prodId.value = result.id!;
    } else {
      throw Exception("Failed to update new product.");
    }
  }

  void deleteProduct() async {
    ProductModel? result = await _apiProvider.deleteProduct(prodId);
    if(result == null){
      newProduct.value = null;
      prodId.value = -1;
    }
  }
}

class ApiProvider extends GetConnect {

  // It offers a user-friendly API for GET, POST, PUT, and DELETE requests with features like automatic JSON decoding and error handling.

  Future<void> fetchProducts(RxList<ProductModel?> data) async {
    final response = await get(
      'https://fakestoreapi.com/products',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } else {
      data.addAll(List<ProductModel>.from(response.body.map((value) =>ProductModel.fromJson(value))));
    }
  }

  Future<ProductModel?> addProduct(Map<String, Object> data) async {
    final response = await post(
      'https://fakestoreapi.com/products',
      data,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } else {
       var result2 = jsonDecode(response.bodyString.toString());
       return ProductModel.fromJson(result2);
    }
  }

  Future<ProductModel?> updateProduct(Map<String, Object> data, RxInt prodId) async {
    final response = await put(
      'https://fakestoreapi.com/products/${prodId.value}',
      data,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } else {
      var result2 = jsonDecode(response.bodyString.toString());
      return ProductModel.fromJson(result2);
    }
  }

  Future<ProductModel?> deleteProduct(RxInt prodId) async{
    final response = await delete(
      'https://fakestoreapi.com/products/${prodId.value}',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } else {
      var result = jsonDecode(response.bodyString.toString());
      if(result != null) {
        return ProductModel.fromJson(result);
      } else {
        return null;
      }
    }
  }
}