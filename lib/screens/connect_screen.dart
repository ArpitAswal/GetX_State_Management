import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/connect_controller.dart';
import 'package:getx/utils/custom_widgets.dart';

import '../DataModel/products_model.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetConnectScreen(),
    );
  }
}

class GetConnectScreen extends StatelessWidget{
  GetConnectScreen({super.key});

  final controller = Get.put(ConnectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: "GetConnect Screen", size: 16),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            customText(text: "API methods through Get Connect method", size: 14),
            const SizedBox(height: 10),
            Obx(()=> (controller.data.isNotEmpty) ?
                Container(
                  width: Get.width,
                  height: Get.height * 0.35,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.lime, width: 2)),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: controller.data.map((item){
                        return ItemWidget(item);
                      }).toList()
                    ),
                  ),
                 ) : const CircularProgressIndicator()
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.35,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        customElevated(pressed: (){
                          controller.addNewProduct();
                        }, btnText: "Add New Product", ctx: context, widthSpace: 0.35),
                        customElevated(pressed: (){
                          controller.updateProduct();
                        }, btnText: "Update New Product", ctx: context, widthSpace: 0.35),
                        customElevated(pressed: (){
                          controller.deleteProduct();
                        }, btnText: "Delete New Product", ctx: context, widthSpace: 0.35)
                      ],
                    ),
                  ),
                  Obx(()=> (controller.newProduct.value != null) ?
                      SizedBox(
                        height: double.infinity,
                        width: Get.width * 0.45,
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                              side: const BorderSide(color: Colors.white, width: 2)
                          ),
                          elevation: 11,
                          shadowColor: Colors.lime,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                    height: double.infinity,width: Get.width * 0.4,
                                    child: Image.network("${controller.newProduct.value!.image}", fit: BoxFit.contain,)),
                              ),
                              customText(text: "Product: ${controller.newProduct.value!.title}", size: 12),
                              customText(text: "Category: ${controller.newProduct.value!.category}", size: 12),
                              customText(text: "Price: ${controller.newProduct.value!.price}", size: 12),
                              customText(text: "Description: ${controller.newProduct.value!.description}", size: 12),
                            ],
                          ),
                        ),
                      )
                  :const SizedBox())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

 class ItemWidget extends StatelessWidget {
   const ItemWidget(this.item, {super.key});
   final ProductModel? item;

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: double.infinity,
       width: Get.width * 0.45,
       child: Card(
         color: Colors.white,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(21),
           side: const BorderSide(color: Colors.white, width: 2)
         ),
         elevation: 11,
         shadowColor: Colors.lime,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
           children: [
             Expanded(
               child: SizedBox(
                   width: Get.width * 0.4,
                   child: Image.network("${item!.image}", fit: BoxFit.contain,)),
             ),
             customText(text: "Product: ${item!.title}", size: 12),
             customText(text: "Category: ${item!.category}", size: 12),
             customText(text: "Price: ${item!.price}", size: 12),
             customText(text: "Rating: ${item!.rating!.rate}star", size: 12),
           ],
         ),
       ),
     );
   }
 }




