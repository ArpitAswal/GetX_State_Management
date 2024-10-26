import 'package:get/get.dart';
import 'package:getx/controller/container_controller.dart';


class AllBindings extends Bindings{
  @override
  void dependencies() {
    //Get.put(ContainerController(), permanent: false);
    //the dependencies will be deleted if the route using Get.put is removed from the navigation stack. You may want to prevent this and keep the dependencies in memory for the entire app session. You can do that using permanent property set to be true.
    Get.lazyPut<ContainerController>(()=>ContainerController(), fenix: true);
    // it basically means that the dependencies will be created immediately, but will be loaded to memory only when Get.find is called for the first time.
    //Get.lazyPut loads dependencies only one time, which means that if the route gets removed, and created again, Get.lazyPut will not load them again. This default behavior might be preferable in some cases while for others, we have the fenix property set to be true
  }
}