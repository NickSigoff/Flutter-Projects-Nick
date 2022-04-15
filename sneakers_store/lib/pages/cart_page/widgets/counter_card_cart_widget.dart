import 'package:flutter/material.dart';

import '../../../utils/items_list.dart';

class ItemCounter extends StatefulWidget {
  final Function counterFunction;
  final Function? totalPriceFunction;
  final Items item;

  const ItemCounter({
    Key? key,
    required this.counterFunction,
    required this.totalPriceFunction,
    required this.item,
  }) : super(key: key);

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              child: const Icon(Icons.remove),
              onTap: () {
                setState(() {
                  decrementCounter();
                });
              },
            ),
          ),
          Text('${widget.item.itemCounter}'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              child: const Icon(Icons.add),
              onTap: () {
                setState(() {
                  incrementCounter();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void decrementCounter() {
    widget.item.itemCounter == 0 ? widget.item.itemCounter : widget.item.itemCounter--;
    widget.counterFunction(widget.item.itemCounter);
    if (widget.totalPriceFunction != null) {
      widget.totalPriceFunction!(-widget.item.itemCounter * int.parse(widget.item.price) +
          ((widget.item.itemCounter - 1) * int.parse(widget.item.price)));
    }
  }

  void incrementCounter() {
    widget.item.itemCounter++;
    widget.counterFunction(widget.item.itemCounter);
    if (widget.totalPriceFunction != null) {
      widget.totalPriceFunction!(widget.item.itemCounter * int.parse(widget.item.price) -
          ((widget.item.itemCounter - 1) * int.parse(widget.item.price)));
    }
  }
}
