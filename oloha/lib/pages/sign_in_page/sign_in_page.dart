import 'package:flutter/material.dart';
import 'package:oloha/pages/global_widgets/label_image_name_widget.dart';
import 'package:oloha/pages/sign_in_page/widgets/input_form_signin_widget.dart';


import '../../utils/main_colors.dart';


class SignInPage extends StatelessWidget{
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          color: MainColors.background,
          child: Column(
            children: const [
              Spacer(),
              LabelImageNameWidget(),
              Spacer(),
              InputFormSignInPage(),
            ],
          ),
        ),
      ),
    );
  }
  
}