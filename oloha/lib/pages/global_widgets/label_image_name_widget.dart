import 'package:flutter/material.dart';

class LabelImageNameWidget extends StatelessWidget {
  const LabelImageNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            height: 60,
            width: 60,
            child: Image.asset('assets/label.png'),
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'Oloha',
              style: TextStyle(
                fontFamily: 'Gilroy-semibold',
                color: Color(0xff171725),
                fontWeight: FontWeight.w500,
                fontSize: 36,
              ),
            )),
      ],
    );
  }
}
