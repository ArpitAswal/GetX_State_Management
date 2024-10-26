import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var quantity = 0.obs;
  var total = 0.obs;

  List<String> items = [
    "Shoe Item",
    "Cloth Item",
    "Sports Item",
    "Artificial Item",
    "Handmade Item"
  ];

}
