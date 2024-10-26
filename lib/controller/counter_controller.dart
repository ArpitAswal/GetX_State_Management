
import 'package:get/get.dart';

class CounterController extends GetxController{

  // we have to make the variables observable by adding obs
  RxInt counter = 0.obs;

  //second way to initialize the variable and make it observable
  RxInt counter2 = RxInt(0);

  // this variable used in GetBuilder so we don't need to make them observable variable
  String counterMessage = "Counter Initial Value";

  //method's to update the value of both counter
  void increaseCounter(){
    counter++;
    counter2++;
    if(counter.value > 0){
      counterMessage = "Counter Positive Value";
    } else if(counter.value == 0 ){
      counterMessage = "Counter Initial Value";
    }
    update();
  }

  void decreaseCounter(){
    counter--;
    counter2--;
    if(counter.value < 0){
      counterMessage = "Counter Negative Value";
    } else if( counter.value == 0){
      counterMessage = "Counter Initial Value";
    }
    update();
  }
}