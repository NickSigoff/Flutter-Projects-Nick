import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/cart_list.dart';
import 'package:flutter_projects/utils/items_list.dart';

class CustomBottomBarItemPage extends StatefulWidget {
  final VoidCallback favoriteTap;
  final Items item;

  const CustomBottomBarItemPage(
      {Key? key, required this.favoriteTap, required this.item})
      : super(key: key);

  @override
  State<CustomBottomBarItemPage> createState() =>
      _CustomBottomBarItemPageState();
}

class _CustomBottomBarItemPageState extends State<CustomBottomBarItemPage> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CartList.itemsInCart.contains(widget.item)
                        ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 5, color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: const Text(
                              'Added to cart',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (!CartList.itemsInCart.contains(widget.item)) {
                              CartList.itemsInCart.add(widget.item);
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                flex: 4,
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.favoriteTap();
                    });
                  },
                  icon: widget.item.addedToFavorite
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
