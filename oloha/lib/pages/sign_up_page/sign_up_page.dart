import 'package:flutter/material.dart';
import 'package:oloha/pages/sign_up_page/widgets/input_form_signup_page.dart';
import 'package:oloha/utils/main_colors.dart';

import '../global_widgets/label_image_name_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: MainColors.background,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: const [
              Spacer(),
              LabelImageNameWidget(),
              Spacer(),
              InputFormSignUpPage(),
            ],
          ),
        ),
      ),
    );
  }
}
