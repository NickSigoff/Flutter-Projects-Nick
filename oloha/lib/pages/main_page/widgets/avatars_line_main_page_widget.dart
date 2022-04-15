import 'package:flutter/material.dart';

import '../../../utils/avatars_list.dart';
import '../../../utils/main_colors.dart';

class AvatarLineWidgetMainPage extends StatelessWidget {
  const AvatarLineWidgetMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: AvatarsList.avatarsList.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 28,
          ),
          itemBuilder: (context, index) {
            return AvatarWidget(index);
          }),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final int index;

  const AvatarWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: MainColors.background),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(46.0),
        child: Image.asset(AvatarsList.avatarsList[index]),
      ),
    );
  }
}