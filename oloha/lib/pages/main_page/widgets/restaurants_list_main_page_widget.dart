import 'package:flutter/material.dart';
import 'package:oloha/utils/main_colors.dart';

import '../../../utils/restourants.dart';
import '../../card_page/card_page.dart';
import '../../global_widgets/rating_widget.dart';

class RestaurantsListWidgetMainPage extends StatelessWidget {
  const RestaurantsListWidgetMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Experiences in spotlight',
              style: TextStyle(fontSize: 18, fontFamily: 'Gilroy-semibold'),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: RestaurantsList.restaurantList.length,
              separatorBuilder: (context, index) => const SizedBox(
                    width: 24,
                  ),
              itemBuilder: (context, index) {
                return CardRestaurantWidget(
                    item: RestaurantsList.restaurantList[index]);
              }),
        ),
      ],
    );
  }
}

class CardRestaurantWidget extends StatelessWidget {
  final Restaurant item;

  const CardRestaurantWidget({Key? key, required this.item}) : super(key: key);

  void onTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CardPage(),
            settings: RouteSettings(arguments: item)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: InkWell(
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(item.imageName),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.type,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Gilroy-regular',
                      color: MainColors.hintColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        item.description,
                        softWrap: true,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'Gilroy-semibold',
                          color: MainColors.restaurantDescription,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RatingWidget(
                            rating: item.rating,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '\$${item.price}',
                              style: const TextStyle(
                                  color: MainColors.background,
                                  fontSize: 12,
                                  fontFamily: 'Gilroy-semibold'),
                              children: const [
                                TextSpan(
                                  text: '/ person',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontFamily: 'Gilroy-semibold'),
                                )
                              ],
                            ),
                          )
                          //Text('${item.price} / person', style: TextStyle(),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Positioned(
              top: 15,
              right: 10,
              child: Icon(
                Icons.favorite_outline_outlined,
                color: Colors.white,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  onTap(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
