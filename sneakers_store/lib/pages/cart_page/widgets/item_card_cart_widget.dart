import 'package:flutter/material.dart';
import '../../../utils/items_list.dart';
import 'counter_card_cart_widget.dart';

class ItemCartCard extends StatefulWidget {
  final Items item;
  final Function totalPriceFunction;

  const ItemCartCard(
      {Key? key, required this.item, required this.totalPriceFunction})
      : super(key: key);

  @override
  State<ItemCartCard> createState() => _ItemCartCardState();
}

class _ItemCartCardState extends State<ItemCartCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(
          width: 1.0,
          color: Colors.grey.withOpacity(0.4),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Checkbox(
            value: widget.item.checkBoxState,
            onChanged: (bool? newValue) {
              setState(() {
                checkBoxSwitch();
              });
            },
          ),
          Expanded(
            flex: 3,
            child: Image(image: AssetImage(widget.item.imageName)),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(widget.item.name, overflow: TextOverflow.ellipsis,),
                const Spacer(),
                ItemCounter(
                    counterFunction: counterFunction,
                    totalPriceFunction:
                    widget.item.checkBoxState ? widget.totalPriceFunction : null,
                    item: widget.item),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(widget.item.price + widget.item.currency),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void counterFunction(int value) {
    widget.item.itemCounter = value;
  }

  void checkBoxSwitch() {
    widget.item.checkBoxState = !widget.item.checkBoxState;
    if (widget.item.checkBoxState) {
      widget.totalPriceFunction(widget.item.calculatePrice());
    } else {
      widget.totalPriceFunction(-widget.item.calculatePrice());
    }
  }
}
