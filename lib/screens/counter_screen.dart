import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/counter_controller.dart';
import 'package:getx/utils/custom_widgets.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final countController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          customText(text: "Simple State Manager, update the counter message", size: 16),
          const SizedBox(height: 10),
          GetBuilder(init: CounterController(),
              builder: (value)=>customText(text: value.counterMessage, size: 18)),
          //Simple State Manager, update the UI part with GetBuilder
          //Note : When using GetBuilder, it’s important to provide the ‘init’ property or a generic function to pass your controller; otherwise, it may result in Null check errors.
          const SizedBox(height: 10),
          customText(text: "Reactive State Manager, update the counter value", size: 16),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              customText(text: "Counter 1", size: 15),
              customText(text: "Counter 2", size: 15),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(()=> customText(text: countController.counter.value.toString(), size: 16, weight: FontWeight.w600, color: Colors.black87)),
              //one way to update the small part of UI with the help of reactive state manager
              GetX<CounterController>(builder: (controller)=> customText(text: controller.counter2.value.toString(), size: 16,weight: FontWeight.w600, color: Colors.black87))
              //second way to update the small part of UI with the help of another reactive state manager
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              customElevated(pressed: (){
                countController.decreaseCounter();
              }, btnText: "Counter--", ctx: context, widthSpace: 0.35),
              customElevated(pressed: (){
                countController.increaseCounter();
              }, btnText: "Counter++", ctx: context, widthSpace: 0.35),
            ],
          ),
        ],
      ),
    );
  }
}
