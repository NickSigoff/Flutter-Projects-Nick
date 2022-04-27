import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class CurrentDateWidget extends StatelessWidget {
  CurrentDateWidget({Key? key}) : super(key: key); // 8:18pm

  getCurrentDate() {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 30,
      decoration: BoxDecoration(
        color: MainColors.currentDateWidgetColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        getCurrentDate(),
        style: const TextStyle(
          color: MainColors.dateTextColor,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
