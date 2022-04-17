import 'package:flutter/material.dart';
import 'package:oloha/pages/global_widgets/rating_widget.dart';
import 'package:oloha/utils/avatars_list.dart';
import 'package:oloha/utils/food_list.dart';
import 'package:oloha/utils/main_colors.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        YourRatingWidget(),
      ],
    );
  }
}

class YourRatingWidget extends StatefulWidget {
  const YourRatingWidget({Key? key}) : super(key: key);

  @override
  State<YourRatingWidget> createState() => _YourRatingWidgetState();
}

class _YourRatingWidgetState extends State<YourRatingWidget> {
  List<Widget> posts = [];

  @override
  void initState() {
    super.initState();
// todo may i do like this?
    for (int i = 0; i < AvatarsList.avatarsList.length; i++) {
      if (i == 0) {
        posts.add(Container(
          height: 1,
          color: MainColors.horizontalLine,
        ));
      }
      posts.add(CommentWidget(avatar: AvatarsList.avatarsList[i]));
      if (i != AvatarsList.avatarsList.length) {
        posts.add(Container(
          height: 1,
          color: MainColors.horizontalLine,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Your rating',
            style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-semibold'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.star_border_purple500_outlined,
                color: MainColors.horizontalLine,
                size: 50,
              ),
              Icon(
                Icons.star_border_purple500_outlined,
                color: MainColors.horizontalLine,
                size: 50,
              ),
              Icon(
                Icons.star_border_purple500_outlined,
                color: MainColors.horizontalLine,
                size: 50,
              ),
              Icon(
                Icons.star_border_purple500_outlined,
                color: MainColors.horizontalLine,
                size: 50,
              ),
              Icon(
                Icons.star_border_purple500_outlined,
                color: MainColors.horizontalLine,
                size: 50,
              ),
            ],
          ),
        ),
        ...posts,
      ],
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String avatar;

  const CommentWidget({Key? key, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      height: 220,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(46),
                    image: DecorationImage(
                      image: AssetImage(avatar),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 1,),
          Expanded(
            flex: 12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Lela Peterson\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gilroy-semibold'),
                        children: [
                          TextSpan(
                              text: 'Posted 3 hours ago',
                              style: TextStyle(
                                  color: MainColors.hintColor,
                                  fontSize: 12,
                                  fontFamily: 'Gilroy-regular')),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                    const RatingWidget(rating: 4.5),
                  ],
                ),
                const Text(
                  'A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper',
                  style: TextStyle(
                    color: MainColors.hintColor,
                    fontSize: 15,
                    fontFamily: 'Gilroy-regular',
                  ),
                  softWrap: true,
                ),
                const ImageLineWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageLineWidget extends StatelessWidget {
  const ImageLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageWidget(image: FoodList.foodList[0]),
        const SizedBox(
          width: 10,
        ),
        ImageWidget(image: FoodList.foodList[1]),
        const SizedBox(
          width: 10,
        ),
        ImageWidget(image: FoodList.foodList[2]),
        const SizedBox(
          width: 10,
        ),
        ImageWidget(image: FoodList.foodList[3]),
        const SizedBox(
          width: 10,
        ),
        ImageWidget(
          image: FoodList.foodList[4],
          isLast: true,
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String image;
  final bool isLast;

  const ImageWidget({Key? key, required this.image, this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
        ),
        isLast
            ? Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'More',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy-regular',
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
