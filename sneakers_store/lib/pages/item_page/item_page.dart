import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/cart_page/cart_page.dart';
import 'package:flutter_projects/pages/item_page/widgets/custom_bottom_bar_item_page.dart';

import '../../utils/items_list.dart';

class ItemPage extends StatefulWidget {
  final VoidCallback favoriteTap;
  final Items item;

  const ItemPage({Key? key, required this.item, required this.favoriteTap})
      : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              }),
        ],
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset(widget.item.imageName),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.item.name,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListViewItem(
                      child: Text(
                        '${widget.item.price} ${widget.item.currency}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const ListViewItem(child: Text('Choose size')),
                    const ListViewItem(child: Text('Customer reviews')),
                    const ListViewItem(child: Text('Questions')),
                  ],
                ),
              ),
            ],
          ),
          CustomBottomBarItemPage(
            favoriteTap: widget.favoriteTap,
            item: widget.item,
          ),
        ],
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  final Widget child;

  const ListViewItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.withOpacity(0.3)))),
      child: child,
    );
  }
}
