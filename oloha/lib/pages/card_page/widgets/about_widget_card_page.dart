import 'package:flutter/material.dart';

import '../../../utils/restourants.dart';

class AboutWidgetCardPage extends StatefulWidget {
  final Restaurant item;

  const AboutWidgetCardPage({Key? key, required this.item}) : super(key: key);

  @override
  State<AboutWidgetCardPage> createState() => _AboutWidgetCardPageState();
}

class _AboutWidgetCardPageState extends State<AboutWidgetCardPage> {
  //bool _readMore = true;

  // void _onTapLink() {
  //   setState(() => _readMore = !_readMore);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 14.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About\n',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Gilroy-semibold',
                color: Colors.black,
              )),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 60),
            painter: MyPainter(widget.item),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final String _kEllipsis = '\u2026';
  final Restaurant item;
  final fontSize = 16.0;
  var overflow = false;

  MyPainter(this.item);

  @override
  void paint(Canvas canvas, Size size) {
    if (fontSize * 4 > size.height) {
      overflow = true;
      print(overflow);
    }

    final textStyle = TextStyle(
          fontSize: fontSize,
          fontFamily: 'Gilroy-regular',
          color: const Color(0xff696974),
        ),
        textSpan = TextSpan(
                text: item.about,
                style: textStyle,
              );

    final textPainter = TextPainter(
      maxLines: 4,
      ellipsis: '...',
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    const offset = Offset(0, 0);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
