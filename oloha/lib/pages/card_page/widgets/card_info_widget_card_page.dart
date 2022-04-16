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
                  color: Colors.green, fontFamily: 'Gilroy-regular'),
              children: [
                TextSpan(
                    text: item.opening,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'Gilroy-regular'))
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
            itemInfo: Text(
              'About ${item.waitingTime} minutes',
              style:
                  const TextStyle(fontFamily: 'Gilroy-regular', fontSize: 14),
            )),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: HorizontalLine(),
        ),
        InfoLineWidget(
            description: 'Type',
            itemInfo: Text(
              item.type,
              style:
                  const TextStyle(fontFamily: 'Gilroy-regular', fontSize: 14),
            )),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: HorizontalLine(),
        ),
        InfoLineWidget(
            description: 'Capacity',
            itemInfo: Text(
              '${item.capacity} Adults',
              style:
                  const TextStyle(fontFamily: 'Gilroy-regular', fontSize: 14),
            )),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: HorizontalLine(),
        ),
        const InfoLineWidget(
            description: 'Good for',
            itemInfo: Text(
              'Coffee, Snack food, Take away',
              style: TextStyle(fontFamily: 'Gilroy-regular', fontSize: 14),
            )),
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
