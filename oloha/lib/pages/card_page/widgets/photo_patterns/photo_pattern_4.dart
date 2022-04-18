import 'package:flutter/material.dart';

class PhotoPattern4 extends StatelessWidget {
  final String image1;
  final String image2;
  final double sizeBetween;

  const PhotoPattern4({
    Key? key,
    required this.image1,
    required this.image2,
    required this.sizeBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image1),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            width: sizeBetween,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image2),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
