import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/utils/custom_widgets.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "First Page", size: 16),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          customText(text: "Go Back to previous screen as we do with Navigator.pop", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.back();
          }, btnText: "Previous Screen", ctx: context, widthSpace: 0.4)
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const routeName = "/SecondPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "Second Page", size: 16),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          customText(text: "Go Back to previous screen as we do with Navigator.pop", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.back();
          }, btnText: "Previous Screen", ctx: context, widthSpace: 0.4)
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  static const routeName = "/ThirdPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "Third Page", size: 16),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          customText(text: "Go Back to previous screen as we do with Navigator.pop but the twist part is we could not back to exactly that screen from where we came to this screen, also this button functionality does not work because of there is no screen in navigation stack according to GetMaterialApp but we can move back to the first screen by bottom back device button because the main screen is still in navigation stack of MaterialApp", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.back();
          }, btnText: "Previous Screen", ctx: context, widthSpace: 0.4)
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "Fourth Page", size: 16),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          customText(text: "Go Back to previous screen as we do with Navigator.pop but the twist past is all the previous screens are removed from Navigation Stack so this is only screen currently App has", size: 14),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Get.back();
          }, btnText: "Previous Screen", ctx: context, widthSpace: 0.4)
        ],
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  FifthPage({super.key});

  final screenData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "Fifth Page", size: 16),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          customText(text: "Let's see what data we get from previous screen", size: 14),
          const SizedBox(height: 10),
          customText(text: "Screen Data: $screenData", size: 16, color: Colors.green, weight: FontWeight.w600),
          const SizedBox(height: 10),
          customText(text: "Let's also send data back to the previous screen", size: 14),
          customElevated(pressed: (){
            Get.back(result: "Perfectly received the data from where we send the data before");
          }, btnText: "Previous Screen", ctx: context, widthSpace: 0.4)
        ],
      ),
    );
  }
}