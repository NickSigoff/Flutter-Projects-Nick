import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/cart_list.dart';
import 'widgets/item_card_cart_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  int totalPrice = 0;

  void calculateTotalPrice(int add) {
    setState(() {
      totalPrice += add;
      totalPrice = totalPrice > 0 ? totalPrice : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    for (var element in CartList.itemsInCart) {
      if (element.checkBoxState) {
       totalPrice += element.calculatePrice();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData.fallback(),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Total Price = $totalPrice \$',
                style: const TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: CartList.itemsInCart.isEmpty
          ? const EmptyCart()
          : Stack(
        children: [
          GridView.builder(
            itemCount: CartList.itemsInCart.length,
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 4,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: MediaQuery
                    .of(context)
                    .size
                    .width),
            itemBuilder: (BuildContext context, int index) {
              final item = CartList.itemsInCart[index];
              return Dismissible(
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      CartList.itemsInCart.remove(item);
                      item.checkBoxState = false;
                      item.itemCounter = 1;
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                        BorderRadius.all(Radius.circular(5))),
                    child: const Icon(Icons.delete_outline,
                        color: Colors.black),
                  ),
                  key: Key(item.id),
                  child: ItemCartCard(
                      item: item,
                      totalPriceFunction: calculateTotalPrice));
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.account_balance_wallet_outlined),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text(
            "No items added to cart",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 60,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
