import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/utils/custom_widgets.dart';

class GetXFeaturesScreen extends StatelessWidget {
  const GetXFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const InBuiltFeatures(),
    );
  }
}

class InBuiltFeatures extends StatelessWidget {
  const InBuiltFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: "GetX In-Built Features", size: 16),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
      },
      shape: const CircleBorder(side: BorderSide(color: Colors.white, width: 2)),
      backgroundColor: Colors.green,
      tooltip: "ChangeTheme",
      child: Icon(Get.isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded, color: Colors.white,),),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          textDirection: TextDirection.ltr,
          children: [
            customText(text: "SnackBar Feature", size: 14, align: TextAlign.center),
            const SizedBox(height: 10),
            customElevated(
                pressed: () {
                 openSnackBar();
                },
                btnText: "Open SnackBar",
                ctx: context,
                widthSpace: 0.5),
            const SizedBox(height: 10),
            customText(text: "DialogBox Feature", size: 14),
            const SizedBox(height: 10),
            customElevated(
                pressed: () {
                  openDialog();
                },
                btnText: "Open DialogBox",
                ctx: context,
                widthSpace: 0.5),
            const SizedBox(height: 10),
            customText(text: "BottomSheet Feature", size: 14),
            const SizedBox(height: 10),
            customElevated(
                pressed: () {
                  openBottomSheet();
                },
                btnText: "Open BottomSheet",
                ctx: context,
                widthSpace: 0.5),
          ],
        ),
      ),
    );
  }

  void openSnackBar() {
    Get.showSnackbar(
        const GetSnackBar(title: 'GetX SnackBar',
            message:'This basic snack bar is one of the GetX in-built feature',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 20,
            margin: EdgeInsets.all(12),
            duration: Duration(seconds: 5),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
            icon: Icon(Icons.error),
            borderColor: Colors.lime,
            borderWidth: 3,));

    Get.snackbar(
        'GetX SnackBar',
        'This basic snack bar is one of the GetX in-built feature',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        duration: const Duration(seconds: 5),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
        icon: const Icon(Icons.error),
        borderColor: Colors.lime,
        borderWidth: 3
    );
  }

  void openDialog() {
    Get.defaultDialog(
        title: "GetX Default Dialog",
        middleText: "In middle",
        backgroundColor: Colors.green,
        titleStyle: const TextStyle(color: Colors.black),
        middleTextStyle: const TextStyle(color: Colors.lightBlue),
        confirm: IconButton(onPressed: ()=> Get.back(closeOverlays: true), icon: const Icon(Icons.done, color: Colors.lime,)),
        cancel: IconButton(onPressed: ()=> Get.back(closeOverlays: true), icon: const Icon(Icons.clear, color: Colors.red,)),
        radius: 24,
        content: customText(text: "This default alert dialog box is in-built feature of GetX", size: 16, color: Colors.white)
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      elevation: 8.0,
      ignoreSafeArea: true,
      persistent: false,
      Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            border: Border.all(color:Colors.white, width: 2),
            boxShadow: const <BoxShadow>[
              BoxShadow(color: Colors.limeAccent)
            ]
          ),
          alignment: Alignment.center,
          child: customText(
              text: "This basic bottom sheet is one of the GetX in-built feature",
              size: 16,
              color: Colors.white,
              weight: FontWeight.w600)),
    );
  }
}
