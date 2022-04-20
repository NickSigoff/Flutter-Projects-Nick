import 'package:flutter/material.dart';

import '../../../../utils/main_colors.dart';

class PhotoPattern2 extends StatelessWidget {
  final String image1;

  const PhotoPattern2({Key? key, required this.image1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image1),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
