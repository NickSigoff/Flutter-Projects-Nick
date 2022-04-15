import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/create_account_page/create_account_page.dart';
import 'package:flutter_projects/pages/welcome_page/widgets/background_welcome_widget.dart';

import '../../global_widgets/gesture_button_widget.dart';
import '../../global_widgets/header_inscription_widget.dart';
import '../../utils/main_colors.dart';
import 'widgets/input_block_welcome_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BackgroundWelcomePage(),
              Container(
                padding: const EdgeInsets.fromLTRB(36, 132, 36, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderInscription(text: 'Welcome\nBack'),
                    const Spacer(
                      flex: 1,
                    ),
                    const InputBlockWelcomePage(),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccountPage()));
                          },
                          text: 'Sign Up',
                          color: MainColors.blueStain,
                          width: 80,
                        ),
                        const GestureButton(
                          text: 'Forgot Password',
                          color: MainColors.orangeStain,
                          width: 160,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
