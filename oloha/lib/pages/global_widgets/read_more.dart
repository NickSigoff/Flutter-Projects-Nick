// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// enum TrimMode {
//   Length,
//   Line,
// }
//
// class ReadMoreText extends StatefulWidget {
//   const ReadMoreText(
//       this.data, {
//         Key key,
//         this.trimExpandedText = ' read less',
//         this.trimCollapsedText = ' ...read more',
//         this.colorClickableText,
//         this.trimLength = 240,
//         this.trimLines = 2,
//         this.trimMode = TrimMode.Length,
//         this.style,
//         this.textAlign,
//         this.textDirection,
//         this.locale,
//         this.textScaleFactor,
//         this.semanticsLabel,
//       })  : assert(data != null),
//         super(key: key);
//
//   final String data;
//   final String trimExpandedText;
//   final String trimCollapsedText;
//   final Color colorClickableText;
//   final int trimLength;
//   final int trimLines;
//   final TrimMode trimMode;
//   final TextStyle style;
//   final TextAlign textAlign;
//   final TextDirection textDirection;
//   final Locale locale;
//   final double textScaleFactor;
//   final String semanticsLabel;
//
//   @override
//   ReadMoreTextState createState() => ReadMoreTextState();
// }
//
// const String _kEllipsis = '\u2026';
//
// const String _kLineSeparator = '\u2028';
//
// class ReadMoreTextState extends State<ReadMoreText> {
//   bool _readMore = true;
//
//   void _onTapLink() {
//     setState(() => _readMore = !_readMore);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
//     TextStyle effectiveTextStyle = widget.style;
//     if (widget.style == null || widget.style.inherit) {
//       effectiveTextStyle = defaultTextStyle.style.merge(widget.style);
//     }
//
//     final textAlign =
//         widget.textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start;
//     final textDirection = widget.textDirection ?? Directionality.of(context);
//     final textScaleFactor =
//         widget.textScaleFactor ?? MediaQuery.textScaleFactorOf(context);
//     final overflow = defaultTextStyle.overflow;
//     final locale =
//         widget.locale ?? Localizations.localeOf(context, nullOk: true);
//
//     final colorClickableText =
//         widget.colorClickableText ?? Theme.of(context).accentColor;
//
//     TextSpan link = TextSpan(
//       text: _readMore ? widget.trimCollapsedText : widget.trimExpandedText,
//       style: effectiveTextStyle.copyWith(
//         color: colorClickableText,
//       ),
//       recognizer: TapGestureRecognizer()..onTap = _onTapLink,
//     );
//
//     Widget result = LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         assert(constraints.hasBoundedWidth);
//         final double maxWidth = constraints.maxWidth;
//
//         // Create a TextSpan with data
//         final text = TextSpan(
//           style: effectiveTextStyle,
//           text: widget.data,
//         );
//
//         // Layout and measure link
//         TextPainter textPainter = TextPainter(
//           text: link,
//           textAlign: textAlign,
//           textDirection: textDirection,
//           textScaleFactor: textScaleFactor,
//           maxLines: widget.trimLines,
//           ellipsis: overflow == TextOverflow.ellipsis ? _kEllipsis : null,
//           locale: locale,
//         );
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         final linkSize = textPainter.size;
//
//         // Layout and measure text
//         textPainter.text = text;
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         final textSize = textPainter.size;
//
//         print('linkSize $linkSize textSize $textSize');
//
//         // Get the endIndex of data
//         bool linkLongerThanLine = false;
//         int endIndex;
//
//         if (linkSize.width < maxWidth) {
//           final pos = textPainter.getPositionForOffset(Offset(
//             textSize.width - linkSize.width,
//             textSize.height,
//           ));
//           endIndex = textPainter.getOffsetBefore(pos.offset);
//         }
//         else {
//           var pos = textPainter.getPositionForOffset(
//             textSize.bottomLeft(Offset.zero),
//           );
//           endIndex = pos.offset;
//           linkLongerThanLine = true;
//         }
//
//         var textSpan;
//         switch (widget.trimMode) {
//           case TrimMode.Length:
//             if (widget.trimLength < widget.data.length) {
//               textSpan = TextSpan(
//                 style: effectiveTextStyle,
//                 text: _readMore
//                     ? widget.data.substring(0, widget.trimLength)
//                     : widget.data,
//                 children: <TextSpan>[link],
//               );
//             } else {
//               textSpan = TextSpan(
//                 style: effectiveTextStyle,
//                 text: widget.data,
//               );
//             }
//             break;
//           case TrimMode.Line:
//             if (textPainter.didExceedMaxLines) {
//               textSpan = TextSpan(
//                 style: effectiveTextStyle,
//                 text: _readMore
//                     ? widget.data.substring(0, endIndex) +
//                     (linkLongerThanLine ? _kLineSeparator : '')
//                     : widget.data,
//                 children: <TextSpan>[link],
//               );
//             } else {
//               textSpan = TextSpan(
//                 style: effectiveTextStyle,
//                 text: widget.data,
//               );
//             }
//             break;
//           default:
//             throw Exception(
//                 'TrimMode type: ${widget.trimMode} is not supported');
//         }
//
//         return RichText(
//           textAlign: textAlign,
//           textDirection: textDirection,
//           softWrap: true,
//           //softWrap,
//           overflow: TextOverflow.clip,
//           //overflow,
//           textScaleFactor: textScaleFactor,
//           text: textSpan,
//         );
//       },
//     );
//     if (widget.semanticsLabel != null) {
//       result = Semantics(
//         textDirection: widget.textDirection,
//         label: widget.semanticsLabel,
//         child: ExcludeSemantics(
//           child: result,
//         ),
//       );
//     }
//     return result;
//   }
// }





// import 'package:flutter/material.dart';
//
// import '../../../utils/restourants.dart';
//
// class AboutWidgetCardPage extends StatefulWidget {
//   final Restaurant item;
//
//   const AboutWidgetCardPage({Key? key, required this.item}) : super(key: key);
//
//   @override
//   State<AboutWidgetCardPage> createState() => _AboutWidgetCardPageState();
// }
//
// class _AboutWidgetCardPageState extends State<AboutWidgetCardPage> {
//   //bool _readMore = true;
//
//   // void _onTapLink() {
//   //   setState(() => _readMore = !_readMore);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 20.0,
//         vertical: 14.0,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('About\n',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Gilroy-semibold',
//                 color: Colors.black,
//               )),
//           CustomPaint(
//             size: Size(MediaQuery.of(context).size.width, 60),
//             painter: MyPainter(widget.item),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyPainter extends CustomPainter {
//   final String _kEllipsis = '\u2026';
//   final Restaurant item;
//   final fontSize = 16.0;
//   var overflow = false;
//
//   MyPainter(this.item);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (fontSize * 4 > size.height) {
//       overflow = true;
//       print(overflow);
//     }
//
//     final textStyle = TextStyle(
//       fontSize: fontSize,
//       fontFamily: 'Gilroy-regular',
//       color: const Color(0xff696974),
//     ),
//         textSpan = TextSpan(
//           text: item.about,
//           style: textStyle,
//         );
//
//     final textPainter = TextPainter(
//       maxLines: 4,
//       ellipsis: '...',
//       text: textSpan,
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout(
//       minWidth: 0,
//       maxWidth: size.width,
//     );
//
//     const offset = Offset(0, 0);
//     textPainter.paint(canvas, offset);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
