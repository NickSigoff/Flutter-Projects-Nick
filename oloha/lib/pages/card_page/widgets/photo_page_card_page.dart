import 'package:flutter/material.dart';
import 'package:oloha/pages/card_page/widgets/photo_patterns/photo_pattern_1.dart';
import 'package:oloha/pages/card_page/widgets/photo_patterns/photo_pattern_2.dart';
import 'package:oloha/pages/card_page/widgets/photo_patterns/photo_pattern_3.dart';
import 'package:oloha/pages/card_page/widgets/photo_patterns/photo_pattern_4.dart';
import 'package:oloha/pages/card_page/widgets/photo_patterns/photo_pattern_5.dart';
import 'package:oloha/utils/photo_list.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
      child: Column(
        children: [
          PhotoPattern1(
            sizeBetween: 5,
            image1: PhotoList.photoList[0],
            image4: PhotoList.photoList[1],
            image3: PhotoList.photoList[2],
            image5: PhotoList.photoList[3],
            image2: PhotoList.photoList[4],
          ),
          const SizedBox(
            height: 5,
          ),
          PhotoPattern2(image1: PhotoList.photoList[5]),
          const SizedBox(
            height: 5,
          ),
          PhotoPattern3(
              image1: PhotoList.photoList[6],
              image2: PhotoList.photoList[7],
              image3: PhotoList.photoList[8],
              sizeBetween: 5),
          const SizedBox(
            height: 5,
          ),
          PhotoPattern4(
              image1: PhotoList.photoList[9],
              image2: PhotoList.photoList[10],
              sizeBetween: 5),
          const SizedBox(
            height: 5,
          ),
          PhotoPattern5(
              image1: PhotoList.photoList[11],
              image2: PhotoList.photoList[12],
              image3: PhotoList.photoList[13],
              image4: PhotoList.photoList[14],
              image5: PhotoList.photoList[15],
              image6: PhotoList.photoList[16],
              image7: PhotoList.photoList[17],
              image8: PhotoList.photoList[18],
              sizeBetween: 5)
        ],
      ),
    );
  }
}
