
import 'package:get/get.dart';

import '../controller/shopping_controller.dart';

class ShoppingBinding extends Bindings{
  @override
  void dependencies() {
    Get.create<ShoppingController>(() => ShoppingController()); // different instances for different list items

    Get.put<ShoppingController>(ShoppingController(), tag: 'total', permanent: true); // separate instance to display total
    //We’ll create a list item, which uses two kinds of instances of ShoppingController, one injected by Get.create, another by Get.put.
  }
}