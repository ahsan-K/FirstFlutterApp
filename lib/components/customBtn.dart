import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  final String type;
  final double marginBottom;
  final double radius;
  final double height;
  final double fontSize;




  const CustomBtn(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.type,
      this.radius = 10,
      this.height = 50,
      this.fontSize = 20,
      this.marginBottom = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed != null ? onPressed : () => {},
      splashColor: Color.fromARGB(219, 48, 34, 100),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: height,
          color: type == "primary"
              ? Color.fromRGBO(219, 48, 34, 1)
              : Colors.white, 
            child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: fontSize))),// Specify your background color here
        ),
      )
    );
  }
}

class TouchableText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double marginBottom;
  final double size;

  const TouchableText(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = Colors.black,
      this.size = 20,
      this.marginBottom = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Text(text, style: TextStyle(color: color, fontSize: size)));
  }
}
