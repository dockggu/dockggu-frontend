import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
    final Function()? ontap;
      final String buttonText;
      final double buttonWidth;
      double? buttonHeight;


   YellowButton({super.key,
   required this.ontap,
   required this.buttonText,
   required this.buttonWidth,
   this.buttonHeight = 40
   });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        
        onPressed: ontap, child: Text(buttonText,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
        style: TextButton.styleFrom(
          backgroundColor: Color(0xffFFD66C),
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    
        ),
        ),
    );
   
  }
}
