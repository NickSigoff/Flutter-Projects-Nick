import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  State<CustomAppBarWidget> createState() => CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MainColors.orangeStain,
      title: const Text('Catalog'),
      centerTitle: true,
      leading: const Center(
        child: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
      ),
      actions: const [
        Icon(Icons.person, color: Colors.black, size: 30,),
      ],
    );
  }
}
