import 'package:flutter/material.dart';
import 'package:messenger_app/pages/get_started_pages/get_started_first_page.dart';
import 'package:messenger_app/utils/main_colors.dart';

import '../get_started_second_page.dart';
import '../get_started_third_page.dart';

class NavigationStatusWidget extends StatelessWidget {
  final Widget page;

  const NavigationStatusWidget({Key? key, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        height: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [..._chooseRow(page)],
        ));
  }

  List<Widget> _chooseRow(Widget page) {
    if(page is GetStartedFirstPage) {
      return [_buildElement(30), _buildElement(), _buildElement()];
    } else if(page is GetStartedSecondPage) {
      return [_buildElement(), _buildElement(30), _buildElement()];
    } else if(page is GetStartedThirdPage) {
      return [_buildElement(), _buildElement(), _buildElement(30)];
    }
    return [];
  }

  Widget _buildElement([double width = 10]) {
    return Container(
      height: 10,
      width: width,
      decoration: BoxDecoration(
        color: width > 10 ? MainColors.white : MainColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
