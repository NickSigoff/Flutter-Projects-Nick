import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/item_page/item_page.dart';
import 'package:flutter_projects/utils/items_list.dart';

class ItemCardCatalogWidget extends StatefulWidget {
  final Items item;

  const ItemCardCatalogWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ItemCardCatalogWidget> createState() => _ItemCardCatalogWidgetState();
}

class _ItemCardCatalogWidgetState extends State<ItemCardCatalogWidget> {
  void favoriteButtonTap() {
    widget.item.addedToFavorite = !widget.item.addedToFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
          width: 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,

      /// Card elements

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 8,
              left: 8,
              right: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemImage(imageName: widget.item.imageName),
                const Spacer(),
                ItemName(itemName: widget.item.name),
                ItemPrice(itemPrice: widget.item.price),
                const Spacer(),
                Text(
                  '${widget.item.availableSizes.map((e) => e)}'
                      .replaceAll(')', '')
                      .replaceAll('(', ""),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemPage(
                        item: widget.item,
                        favoriteTap: () {
                          setState(() {
                            favoriteButtonTap();
                          });
                        }),
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              onPressed: () {
                setState(() {
                  favoriteButtonTap();
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
    );
  }
}

/// Item Price Widget
class ItemPrice extends StatelessWidget {
  final String itemPrice;
  final String itemCurrency;

  const ItemPrice({Key? key, required this.itemPrice, this.itemCurrency = '\$'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$itemPrice $itemCurrency',
      maxLines: 1,
      style: const TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }
}

/// Item Name Widget
class ItemName extends StatelessWidget {
  final String itemName;

  const ItemName({Key? key, required this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      itemName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}

/// Item Image Widget
class ItemImage extends StatelessWidget {
  final String imageName;

  const ItemImage({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Image(image: AssetImage(imageName)),
    );
  }
}
