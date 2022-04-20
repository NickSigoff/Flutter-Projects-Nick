import 'package:flutter/material.dart';
import 'package:oloha/pages/global_widgets/rating_widget.dart';
import 'package:oloha/utils/avatars_list.dart';
import 'package:oloha/utils/food_list.dart';
import 'package:oloha/utils/main_colors.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Your rating',
            style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-semibold'),
          ),
        ),
        Rating((p0) => null),
        ...posts,
      ],
    );
  }
}

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  Rating(this.onRatingSelected, [this.maximumRating = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return const Icon(
        Icons.star_border_purple500_outlined,
        color: MainColors.background,
        size: 50,
      );
    } else {
      return const Icon(
        Icons.star_border_purple500_outlined,
        color: MainColors.horizontalLine,
        size: 50,
      );
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(this.widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });

          widget.onRatingSelected(_currentRating);
        },
      );
    });

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: stars,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
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
          const Spacer(
            flex: 1,
          ),
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
