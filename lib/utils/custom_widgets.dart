
import 'package:flutter/material.dart';

 Widget customText({
  required String text,
  required double size,
   Color? color, TextAlign? align, FontWeight? weight,}
  ){
  return Text(text, softWrap: true, textAlign: align ?? TextAlign.center, style: TextStyle(
    fontSize: size,
    color: color ?? Colors.blueAccent,
    fontWeight: weight ?? FontWeight.w500
  ),);
}

Widget customElevated({required Function() pressed, required String btnText, required BuildContext ctx, required double widthSpace,
    Color? bgColor, Color? textColor}){
   return SizedBox(
    width: MediaQuery.of(ctx).size.width * widthSpace,
     height: 40,
     child: ElevatedButton(onPressed: pressed,
     style: ElevatedButton.styleFrom(
      elevation: 8.0,
      shadowColor: Colors.limeAccent,
      backgroundColor: bgColor ?? Colors.green,
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(24),
       side: const BorderSide(color: Colors.limeAccent, width: 1.5)
      )
     ), child: Text(btnText,
         softWrap: true,
         textAlign: TextAlign.center,
         style: TextStyle(fontWeight: FontWeight.bold, color: textColor ?? Colors.white,),),),
   );
}