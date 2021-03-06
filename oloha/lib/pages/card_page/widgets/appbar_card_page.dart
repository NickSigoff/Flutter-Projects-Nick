import 'package:flutter/material.dart';
import 'package:oloha/pages/global_widgets/rating_widget.dart';
import 'package:oloha/utils/main_colors.dart';

import '../../../utils/restourants.dart';

class AppBarCardPage extends StatelessWidget {
  final Restaurant item;

  const AppBarCardPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.imageName),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.favorite_outline,
              color: MainColors.favoriteButtonColors,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 70, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: RatingWidget(rating: item.rating),
                  ),
                  Text(
                    item.type,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy-regular',
                        fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
