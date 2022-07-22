import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/main_colors.dart';
import '../../../blocs/bottom_bar_bloc/current_page_bloc.dart';

class NavigationBarItem extends StatelessWidget {
  final IconData iconData;
  final int index;
  final int state;

  const NavigationBarItem({
    Key? key,
    required this.iconData,
    required this.index,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<CurrentPageBloc>().add(OnPressEvent(index));
        },
        child: Icon(iconData,
            color: state == index
                ? MainColors.commonWhite
                : MainColors.lightGrey),
      ),
    );
  }
}