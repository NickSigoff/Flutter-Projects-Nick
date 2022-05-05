import 'package:flutter/material.dart';

class InformationRow extends StatelessWidget {
  final String icon;
  final String text;
  final String value;

  const InformationRow({
    Key? key,
    required this.icon,
    required this.value,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(icon),
            Text(text),
            const Spacer(),
            Text(value),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.orange,
        ),
      ],
    );
  }
}