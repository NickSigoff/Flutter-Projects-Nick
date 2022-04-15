import 'package:flutter/material.dart';

import 'package:flutter_projects/pages/create_account_page/widgets/input_block_create_account_widget.dart';
import 'package:flutter_projects/pages/create_account_page/widgets/background_create_account_widget.dart';

import '../../global_widgets/gesture_button_widget.dart';
import '../../global_widgets/header_inscription_widget.dart';
import '../../global_widgets/arrow_back_button_widget.dart';
import '../../utils/main_colors.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.blueStain,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BackgroundCreateAccount(),
              const TopBackButton(),
              Container(
                padding: const EdgeInsets.fromLTRB(36, 132, 36, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderInscription(text: 'Create\nAccount'),
                    const Spacer(
                      flex: 1,
                    ),
                    const InputBlockCreateAccountPage(),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: const [
                        Spacer(),
                        GestureButton(
                          text: 'Sign Up',
                          color: MainColors.blueStain,
                          width: 90,
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
