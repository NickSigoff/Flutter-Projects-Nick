import 'package:flutter/material.dart';

class GestureButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color color;
  final double? height;
  final double? width;
  final GestureTapCallback? onTap;

  final defaultBandWidth = 10.0;
  final defaultBandHeight = 10.0;


  const GestureButton({
    Key? key,
    this.text,
    this.onTap,
    this.icon,
    this.width,
    this.height,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: width ?? defaultBandWidth,
            height: height ?? defaultBandHeight,
            color: color,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: fillChild(context),
          ),
        ],
      ),
    );
  }

  Widget fillChild(BuildContext context) {
    if (text != null) {
      return Text(
        text!,
        style: Theme.of(context).textTheme.button,
      );
    }
    return Icon(icon);
  }
}