import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/catalog_page/widgets/item_card_catalog_widget.dart';
import 'package:flutter_projects/utils/items_list.dart';

import '../cart_page/cart_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  final _searchController = TextEditingController();

  var searchedItems = <Items>[];

  static var cartItems = <int, ItemCardCatalogWidget>{};

  void searchItem() {
    if (_searchController.text.isEmpty) {
      searchedItems = ItemsList.sneakersList;
    } else {
      searchedItems = ItemsList.sneakersList.where((Items item) {
        return item.name
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchedItems = ItemsList.sneakersList;
    _searchController.addListener(searchItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: ()=> exit(0),
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchField(searchController: _searchController),
          )
        ],
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Sneakers\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '${ItemsList.sneakersList.length} items',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: GridView.count(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            bottom: 10,
            top: 8,
          ),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: <Widget>[
            ...searchedItems
                .map((Items item) => ItemCardCatalogWidget(item: item))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_filled,
                ),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CartPage()));
                },
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline_outlined),
              ),
              label: 'Favorite'),
        ],
      ),
    );
  }
}

/// Shows and hides searching
class SearchField extends StatelessWidget {
  final TextEditingController searchController;

  const SearchField({Key? key, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;
    return SizedBox(
      width: width,
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withAlpha(180),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class NumberItemsInCartWidget extends StatefulWidget {
  final int numberItemsInCart;

  const NumberItemsInCartWidget({Key? key, required this.numberItemsInCart})
      : super(key: key);

  @override
  State<NumberItemsInCartWidget> createState() =>
      _NumberItemsInCartWidgetState();
}

class _NumberItemsInCartWidgetState extends State<NumberItemsInCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13,
      width: 13,
      decoration:
          const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Center(
        child: Text(
          '${widget.numberItemsInCart}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
