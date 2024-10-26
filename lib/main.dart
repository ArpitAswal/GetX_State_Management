import 'package:flutter/material.dart';
import 'package:getx/screens/asynchronous_screen.dart';
import 'package:getx/screens/binding_screen.dart';
import 'package:getx/screens/connect_screen.dart';
import 'package:getx/screens/counter_screen.dart';
import 'package:getx/screens/getx_features.dart';
import 'package:getx/screens/navigation_ways_screen.dart';
import 'package:getx/screens/shoppingcart%20screen.dart';
import 'package:getx/utils/custom_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Getx State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.blueAccent,
        secondaryHeaderColor: Colors.green,
        useMaterial3: true,
      ),
      home: const FrontPage(),
    );
  }
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn GetX State Management"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          customText(text: "From this screen we can navigate to different screen by clicking on button",
              size: 14, align: TextAlign.center
            ),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CounterScreen()));
          }, btnText: "Counter Example", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const BindingConceptScreen()));
          }, btnText: "Binding Concept", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const NavigationWaysScreen()));
          }, btnText: "Navigation/Route", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const GetXFeaturesScreen()));
          }, btnText: "GetX Basic Features", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const AsynchronousScreen()));
          }, btnText: "Asynchronous Programming", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ShoppingCartScreen()));
          }, btnText: "Get.create", ctx: context, widthSpace: 0.5),
          const SizedBox(height: 10),
          customElevated(pressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ConnectScreen()));
          }, btnText: "GetConnect", ctx: context, widthSpace: 0.5)
        ],
      )
    );
  }
}

