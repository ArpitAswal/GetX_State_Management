import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/utils/custom_widgets.dart';

import '../Bindings/shopping_binding.dart';
import '../controller/shopping_controller.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ShoppingBinding(),
      home: const CartFeature(),
    );
  }
}

class CartFeature extends StatelessWidget {
  const CartFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: customText(text: "Get.create use case", size: 16),
        centerTitle: true,
      ),
      body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customText(text: "This one is for those rare cases which you may never come across, but when you do, you’ll realize how useful this can be. Unlike all other methods, this one creates a new instance of the dependency every time Get.find is called.So when should we use it? When we have multiple widgets on a page, that depend on the same controller, but need to update individually. Example? A shopping cart of course!", size: 14),

              Obx(() => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Total: ${Get.find<ShoppingController>(tag: 'total').total.value}', // total
                ),
              )),

              Expanded(
                child: ListView.builder(
                    itemCount: Get.find<ShoppingController>(tag: 'total').items.length,
                    itemBuilder: (context, index) {
                  return ShoppingItem(Get.find<ShoppingController>(tag: 'total').items[index]);
                }),
              ),
            ],
          ),
      ),
    );
  }
}

/*
What we do is-
When we use this widget in a ListView, Get.find is called for each item, which creates separate instances for each of them. This lets us update the quantity for each item individually, without creating separate controllers.

ShoppingController injected by Get.put is used to update and maintain a total as it is shared by all the list items, and across pages as well.
*/

class ShoppingItem extends StatelessWidget {
  ShoppingItem(this.item, {super.key});
  final String item;

  final ShoppingController controller = Get.find(); // injected by Get.create

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: Get.width,
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: customElevated(
                    pressed: () {
                      controller.quantity.value--; // create
                      Get.find<ShoppingController>(tag: 'total').total.value--; // injected by Get.put
                    }, btnText: 'Item--', ctx: context, widthSpace: 0.25
                ),
              ),
        
              Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 100,
                  height: 80,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customText(text: "$item count: ${controller.quantity}", size: 14),
                    ),
                  ),
                )
              )),
        
              Expanded(
                child: customElevated(
                    pressed: () {
                      controller.quantity.value++; // create
                      Get.find<ShoppingController>(tag: 'total').total.value++; // injected by Get.put
                    }, btnText: 'Item++', ctx: context, widthSpace: 0.25
                ),
              ),
        
            ],
          ),
        ),
    );
  }
}

/*
Understanding the Different Lifecycle of Dependencies

Get.create():
Every time Get.find() is called (like in the ShoppingItem), it creates a new instance. This is why quantity is reset when we re-enter the screen.
This method is useful when we want isolated instances of controllers per widget (like in our case, where each item in the list has its own instance of ShoppingController).

Get.put() (with permanent: true):
The instance is created once and stays alive in memory as long as the app is running unless manually removed. This is why the total value does not reset.
 */