import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/global_widgets/resizable_floating_button_widget.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SignInButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        ResizableFloatingActionButton(onTap: onTap),
      ],
    );
  }
}
