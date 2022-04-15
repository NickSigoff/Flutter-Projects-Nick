import 'package:flutter/material.dart';

import '../../../utils/avatars_list.dart';

class AvatarLineWidget extends StatelessWidget {
  const AvatarLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Travel participants',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Gilroy-semibold',
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemBuilder: (context, index) {
                  if (index == 5) {
                    return AvatarWidgetLast(index);
                  }
                  return AvatarWidget(index);
                }),
          ),
        ],
      ),
    );
  }
}

class AvatarWidgetLast extends StatelessWidget {
  final int index;

  const AvatarWidgetLast(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 46,
          height: 46,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(46.0),
            child: Image.asset(AvatarsList.avatarsList[index]),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46.0),
            color: Colors.black.withOpacity(0.6),
          ),
          alignment: Alignment.center,
          width: 46,
          height: 46,
          padding: const EdgeInsets.all(4),
          child: const ClipRRect(
            child: Text(
              '+24',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Gilroy-regular',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final int index;

  const AvatarWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(46.0),
        child: Image.asset(AvatarsList.avatarsList[index]),
      ),
    );
  }
}
