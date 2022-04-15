///inkwell
// Material(
//   color: Colors.transparent,
//   child: InkWell(
//     borderRadius: BorderRadius.circular(20),
//     onTap: () {},
//   ),
// ),

/// inherit
// class CounterProviderInherited extends InheritedWidget {
//   final int counterValue;
//
//   const CounterProviderInherited({
//     Key? key,
//     required this.counterValue,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   @override
//   bool updateShouldNotify(CounterProviderInherited oldWidget) {
//     return counterValue != oldWidget.counterValue;
//   }
// }

/// doublebutton
// DoubleButton(
//   onTapLeftButton: () {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       duration: Duration(seconds: 1),
//       backgroundColor: AppColors.greyStain,
//       content: Text('Item added to cart'),
//     ));
//     widget.isChosenInCart = false;
//     CatalogPageState.cartItems[widget.item.id] = widget;
//   },
//   onTapRightButton: () {
//     Navigator.pushNamed(context, 'catalog_page/item_page',
//         arguments: widget.item.id);
//
//     //         onTap:() {Navigator.pushNamed(context, 'catalog_page/item_page', arguments: widget.itemId);},
//   },
// ),

///snackbar
// ScaffoldMessenger.of(context)
// .showSnackBar(const SnackBar(
// duration: Duration(seconds: 1),
// backgroundColor: Colors.grey,
// content: Text('Item added to cart'),
// ));

///routes
// initialRoute: '/',
// routes: {
//   'catalog_page/item_page': (context) => ItemPage(),
//   'catalog_page/cart_page': (context) =>  const CartPage(),
//   '/create_account_page': (context) => const CreateAccountPage(),
//   '/catalog_page': (context) => const CatalogPage(),
// },

