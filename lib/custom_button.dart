

  import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget{
  final String text;
  final IconData? icon;
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double width;
  //final double borderRadius;

  const CustomButtonWidget({super.key,
    required this.text,
    this.icon,
    required this.color,
    required this.onPressed,
    required this.height,
    required this.width,
   // required this.borderRadius

  });




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null ? Icon(icon) : SizedBox.shrink(),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          /*shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),*/
        ),
      ),
    );
  }
}