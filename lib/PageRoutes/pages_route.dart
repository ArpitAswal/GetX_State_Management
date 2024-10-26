
import 'package:get/get.dart';
import 'package:getx/Bindings/binding_all_bindings.dart';
import 'package:getx/screens/binding_screen.dart';
import 'package:getx/screens/getX_routes.dart';
import 'package:getx/screens/navigation_ways_screen.dart';

class PagesRoute{

  static const initialRoute = BindingMainScreen.routeName;
  static final routes = [
    GetPage(name: BindingMainScreen.routeName,
        page: ()=> BindingMainScreen(),
    binding: AllBindings()),
    GetPage(name: GetXRoutesScreen.routeName, page: ()=> const GetXRoutesScreen()),
    GetPage(name: SecondPage.routeName, page: ()=> const SecondPage()),
    GetPage(name: ThirdPage.routeName, page: ()=> const ThirdPage()),
  ];
  
}