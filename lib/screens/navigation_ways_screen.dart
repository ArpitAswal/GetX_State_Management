import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screens/counter_screen.dart';

import '../PageRoutes/pages_route.dart';
import '../utils/custom_widgets.dart';
import 'getX_routes.dart';

class NavigationWaysScreen extends StatelessWidget {
  const NavigationWaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PagesRoute.routes,
      home: const GetXRoutesScreen(),
    );
  }
}

class GetXRoutesScreen extends StatefulWidget {
  const GetXRoutesScreen({super.key});

  static const routeName = "/GetxRouteScreen";

  @override
  State<GetXRoutesScreen> createState() => _GetXRoutesScreenState();
}

class _GetXRoutesScreenState extends State<GetXRoutesScreen> {

  String? returnData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "Basic Navigation with GetX", size: 16),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customText(text: "Navigate to another screen just like we do with Navigator.push", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
             Get.to(()=> const FirstPage());
          }, btnText: "To Next Screen", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 10),
          customText(text: "Navigate to another screen just like we do with Navigator.pushNamed", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.toNamed("/SecondPage");
          }, btnText: "To Next Screen with Named", ctx: context, widthSpace: 0.65),
          const SizedBox(height: 10),
          customText(text: "To go to the next screen but could not back to this current screen, just like we do with Navigator.pushReplacement", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.offAndToNamed("/ThirdPage");
          }, btnText: "To Next & Remove Current Screen", ctx: context, widthSpace: 0.8),
          const SizedBox(height: 10),
          customText(text: "To go to the next screen and cancel all previous routes, just like we do with Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.offAll(()=> CounterScreen());
          }, btnText: "To Next & Remove All Previous Screen", ctx: context, widthSpace: 0.9),
          const SizedBox(height: 10),
          customText(text: "To go to the particular screen and remove all other screens from stack", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.to(()=> const FourthPage());
            Timer(const Duration(seconds: 1), (){
              Get.offNamedUntil('BindingMainScreen', (route) => Get.currentRoute == '/BindingMainScreen');
            },
            );
          }, btnText: "Remove All Screen & Navigate to Target Screen", ctx: context, widthSpace: 0.9),
          const SizedBox(height: 10),
          customText(text: "Send the data from current to next screen, just like we do with Navigator.push(args: value)", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.to(()=> FifthPage(), arguments: "Perfectly data transfer from previous screen to this screen")?.then((value){
              setState(() {
                returnData = value;
              });
            });
          }, btnText: "send data to next screen", ctx: context, widthSpace: 0.5),
          if(returnData != null)
            Padding(padding: const EdgeInsets.all(10), child: customText(text: returnData!, size: 16, color: Colors.green, weight: FontWeight.w600),)
        ],
      ),
    );
  }
}
