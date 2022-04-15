import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: MainColors.ratingColor,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      width: 46,
      height: 23,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$rating",
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Gilroy-semibold',
                fontSize: 12),
          ),
          const Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
