import 'package:flutter/material.dart';

import '../utils/main_colors.dart';

class ResizableFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;

  final defaultContainerWidth = 64.0;
  final defaultContainerHeight = 64.0;

  const ResizableFloatingActionButton({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultContainerHeight,
      width: defaultContainerWidth,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            onTap();
          },
          backgroundColor: MainColors.floatingButtonColor,
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
