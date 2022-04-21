import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oloha/utils/main_colors.dart';

import '../../../utils/restourants.dart';

class AboutWidgetCardPage extends StatefulWidget {
  final Restaurant item;

  const AboutWidgetCardPage({Key? key, required this.item}) : super(key: key);

  Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 4,
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  State<AboutWidgetCardPage> createState() => _AboutWidgetCardPageState();
}

class _AboutWidgetCardPageState extends State<AboutWidgetCardPage> {
  var maxLines = 6;
  final TextStyle textStyle = const TextStyle(
    fontSize: 15,
    fontFamily: 'Gilriy-regular',
    color: Color(0xff696974),
  );
  bool readMore = false;

  @override
  void initState() {
    super.initState();
    Size size = widget.textSize(widget.item.about, textStyle);
    if (size.width > 1300) {
      readMore = true;
    }
  }

  void tapReadLess() {
    setState(() {
      maxLines = 6;
      readMore = !readMore;
    });
  }

  void tapReadMore() {
    setState(() {
      maxLines = 100;
      readMore = !readMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 14.0,
      ),
      child: RichText(
        maxLines: maxLines,
        text: TextSpan(
            text: 'About\n\n',
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Gilroy-semibold',
              color: Colors.black,
            ),
            children: readMore
                ? [
                    TextSpan(
                      text: widget.item.about.substring(0, 200) + '...',
                      style: textStyle,
                    ),
                    TextSpan(
                      text: ' more...',
                      recognizer: TapGestureRecognizer()..onTap = tapReadMore,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Gilriy-regular',
                        color: MainColors.background,
                      ),
                    )
                  ]
                : [
                    maxLines > 4
                        ? TextSpan(
                            text: widget.item.about,
                            style: textStyle,
                            children: [
                                TextSpan(
                                  text: ' \nless...',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = tapReadLess,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gilriy-regular',
                                    color: MainColors.background,
                                  ),
                                )
                              ])
                        : TextSpan(
                            text: widget.item.about,
                            style: textStyle,
                          ),
                  ]),
      ),
    );
  }
}
