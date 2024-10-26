
import 'package:get/get.dart';

class ContainerController extends GetxController{

  //this controller will handle the logic of which Container display with its attributes value
  RxBool bigContainer = RxBool(true);

  // these variable used in GetBuilder so we don't need to make them observable variable
  double leftOpacity = 0.5;
  double rightOpacity = 0.5;

  void changeContainer(){
    bigContainer.value = !bigContainer.value;
  }

  void changeLeftOpacity(double value){
    leftOpacity= value;
    update();
  }

  void changeRightOpacity(double value){
    rightOpacity = value;
    update();
  }
}