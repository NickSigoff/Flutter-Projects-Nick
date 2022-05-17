import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_colors.dart';

class NavigationStatusWidget extends StatelessWidget {
  final int pageNumber;

  const NavigationStatusWidget({Key? key, required this.pageNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        height: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [..._chooseRow(1)],
        ));
  }

  List<Widget> _chooseRow(int pageNumber) {
    switch (pageNumber) {
      case 1:
        return [_buildElement(30), _buildElement(), _buildElement()];
      case 2:
        return [_buildElement(), _buildElement(30), _buildElement()];
      case 3:
        return [_buildElement(), _buildElement(), _buildElement(30)];
      default:
        return [];
    }
  }

  Widget _buildElement([double width = 10]) {
    return Container(
      height: 10,
      width: width,
      decoration: BoxDecoration(
        color: width > 10 ? Colors.white : MainColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
