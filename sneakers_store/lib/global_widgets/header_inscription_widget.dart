import 'package:flutter/material.dart';

class HeaderInscription extends StatelessWidget {
  final String text;

  const HeaderInscription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
