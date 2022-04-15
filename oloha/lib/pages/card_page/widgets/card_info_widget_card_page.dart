import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/restourants.dart';
import '../../global_widgets/horizontal_line_widget.dart';

class CardInfoWidget extends StatelessWidget {
  final Restaurant item;

  const CardInfoWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: HorizontalLine(),
        ),
        InfoLineWidget(
          description: 'Opening hours',
          itemInfo: RichText(
            text: TextSpan(
              text: 'Opening ',
              style: const TextStyle(
                color: Colors.green,
              ),
              children: [
                TextSpan(
                    text: item.opening,
                    style: const TextStyle(color: Colors.black))
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: HorizontalLine(),
        ),
        InfoLineWidget(
            description: 'Waiting time',
            itemInfo: Text('About ${item.waitingTime} minutes')),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: HorizontalLine(),
        ),
        InfoLineWidget(description: 'Type', itemInfo: Text(item.type)),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: HorizontalLine(),
        ),
        InfoLineWidget(
            description: 'Capacity', itemInfo: Text('${item.capacity} Adults')),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: HorizontalLine(),
        ),
        const InfoLineWidget(
            description: 'Good for',
            itemInfo: Text('Coffee, Snack food, Take away')),
      ],
    );
  }
}

class InfoLineWidget extends StatelessWidget {
  final String description;
  final Widget itemInfo;

  const InfoLineWidget(
      {Key? key, required this.description, required this.itemInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            style: const TextStyle(
                color: Color(0xff696974),
                fontSize: 14,
                fontFamily: 'Gilroy-regular'),
          ),
          itemInfo,
        ],
      ),
    );
  }
}
