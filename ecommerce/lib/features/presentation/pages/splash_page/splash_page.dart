import 'package:flutter/material.dart';

import '../../../../utils/main_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.deepBlue,
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              width: 132.0,
              height: 132.0,
              decoration: BoxDecoration(
                color: MainColors.mainRed,
                borderRadius: BorderRadius.circular(132),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 32, left: 32),
                child: const Text('Ecommerce\nConcept',
                    style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800)))
          ],
        ),
      ),
    );
  }
}
