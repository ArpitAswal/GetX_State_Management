
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Bindings/binding_all_bindings.dart';
import 'package:getx/controller/container_controller.dart';
import 'package:getx/utils/custom_widgets.dart';

import '../PageRoutes/pages_route.dart';

class BindingConceptScreen extends StatelessWidget {
  const BindingConceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AllBindings(), // here we will define all the bindings that we would use for this app
      initialRoute: PagesRoute.initialRoute, // the first page/screen that will appear when we navigate to this BindingConceptScreen
      getPages: PagesRoute.routes, // here we will define the all the routes that will connect with BindingConceptScreen
    );
  }
}

class BindingMainScreen extends GetView<ContainerController> {
  const BindingMainScreen({super.key});

  static const routeName = '/BindingMainScreen';
  //final controller = Get.find<ContainerController>();
  //. If we have a single controller as a dependency, we can use GetView instead of StatelessWidget and avoid writing Get.find. Cool right?

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(()=>
                  AnimatedContainer(duration: const Duration(seconds: 3),
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(12),
                    alignment: (controller.bigContainer.value) ? Alignment.bottomLeft : Alignment.topRight,
                    width: (controller.bigContainer.value) ? width * 0.8 : width * 0.5,
                    height: (controller.bigContainer.value) ? 240 : 160,
                    decoration: BoxDecoration(
                      color: (controller.bigContainer.value) ? Colors.yellowAccent : Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(
                          (controller.bigContainer.value) ? 24 :16
                      ),
                      border: Border.all(
                          color:  (controller.bigContainer.value) ? Colors.orange : Colors.yellow, width: 3)
                    ),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: customText(text: (controller.bigContainer.value) ? "Big Container" : "Small Container",
                      size: (controller.bigContainer.value) ? 24 : 16,
                      color: Colors.black, weight: FontWeight.bold),),
                  )
            ],
          ),
          const SizedBox(height: 20),
          customElevated(pressed: (){
            controller.changeContainer();
          }, btnText: "Change Container", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 30),
          GetBuilder(
            init: ContainerController(),
            builder: (ctrl) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(opacity: ctrl.leftOpacity, child: Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.black),
                        image: const DecorationImage(image: AssetImage(
                            "assets/usersAvatar/user3.png"))
                    ),
                  )),
                  Opacity(opacity: ctrl.rightOpacity, child: Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.black),
                        image: const DecorationImage(image: AssetImage(
                            "assets/usersAvatar/user5.png"))
                    ),
                  ))
                ],
              );
            }),
          const SizedBox(height: 20),
          GetBuilder(
            init: ContainerController(),
            builder: (ContainerController controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Slider(value: controller.leftOpacity,
                    onChanged: (value) {
                      controller.changeLeftOpacity(value);
                    },
                    min: 0.0,
                    max: 1.0,
                    label: "Left Profile Opacity",
                    activeColor: Colors.green,
                    inactiveColor: Colors.blue,
                    thumbColor: Colors.red,),

                  Slider(value: controller.rightOpacity,
                    onChanged: (value) {
                      controller.changeRightOpacity(value);
                    },
                    min: 0.0,
                    max: 1.0,
                    label: "Right Profile Opacity",
                    activeColor: Colors.green,
                    inactiveColor: Colors.blue,
                    thumbColor: Colors.red,)
                ],
              );
            })
        ],
      ),
    );
  }
}

/*
When to Use Obx?
⦁	Single Reactive Variable: Use obx when managing the state of a single observable variable.
⦁	Lightweight UI Updates: Ideal for scenarios where you need to update a small part of the UI in response to observable changes.
When to Use GetBuilder?
⦁	Controller-Based State Management: Use GetBuilder when you want to manage the state using a GetController with multiple reactive variables.
⦁	Selective Widget Rebuilding: Effective when you need to rebuild specific widgets instead of the entire UI.
 */

