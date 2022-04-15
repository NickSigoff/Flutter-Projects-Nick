// import 'package:flutter/material.dart';
// import 'package:oloha/pages/card_page/widgets/appbar_card_page.dart';
// import 'package:oloha/pages/global_widgets/horizontal_line_widget.dart';
//
// import '../../utils/avatars_list.dart';
// import '../../utils/main_colors.dart';
// import '../../utils/restourants.dart';
//
// class CardPage extends StatelessWidget {
//   const CardPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final item = ModalRoute.of(context)!.settings.arguments as Restaurant;
//
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: MediaQuery.of(context).size.height * 0.25,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         flexibleSpace: AppBarCardPage(item: item),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             NavigationBar(destinations: const [
//               Center(
//                   child: Text(
//                     'Overview',
//                     style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-regular'),
//                   )),
//               Center(
//                   child: Text(
//                     'Photo',
//                     style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-regular'),
//                   )),
//               Center(
//                   child: Text(
//                     'Rewiev',
//                     style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-regular'),
//                   )),
//               Center(
//                   child: Text(
//                     'Community',
//                     style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-regular'),
//                   )),
//             ]),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: RichText(
//                 text: TextSpan(
//                     text: 'About\n\n',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'Gilroy-semibold',
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: item.about,
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontFamily: 'Gilriy-regular',
//                           color: Color(0xff696974),
//                         ),
//                       )
//                     ]),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 20, bottom: 10),
//               child: HorizontalLine(),
//             ),
//             InfoLineWidget(
//               description: 'Opening hours',
//               itemInfo: RichText(
//                 text: TextSpan(
//                   text: 'Opening ',
//                   style: const TextStyle(
//                     color: Colors.green,
//                   ),
//                   children: [
//                     TextSpan(
//                         text: item.opening,
//                         style: const TextStyle(color: Colors.black))
//                   ],
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: HorizontalLine(),
//             ),
//             InfoLineWidget(
//                 description: 'Waiting time',
//                 itemInfo: Text('About ${item.waitingTime} minutes')),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: HorizontalLine(),
//             ),
//             InfoLineWidget(description: 'Type', itemInfo: Text(item.type)),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: HorizontalLine(),
//             ),
//             InfoLineWidget(
//                 description: 'Capacity',
//                 itemInfo: Text('${item.capacity} Adults')),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: HorizontalLine(),
//             ),
//             const InfoLineWidget(
//                 description: 'Good for',
//                 itemInfo: Text('Coffee, Snack food, Take away')),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 18, top: 10),
//               child: HorizontalLine(),
//             ),
//             const InfoLineIconWidget(
//                 icon: Icon(Icons.coffee_outlined), text: 'Coffee / Breakfast'),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 18),
//               child: HorizontalLine(),
//             ),
//             const InfoLineIconWidget(
//                 icon: Icon(Icons.taxi_alert), text: 'Free bike park'),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 18),
//               child: HorizontalLine(),
//             ),
//             const InfoLineIconWidget(
//                 icon: Icon(Icons.delivery_dining), text: 'Delivery services'),
//             Row(children: [Text('Location')]),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               width: MediaQuery.of(context).size.width - 40,
//               height: 170,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/map.png'),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             const Text(
//               'Travel participants',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontFamily: 'Gilroy-semibold',
//                 fontSize: 18,
//               ),
//             ),
//             AvatarLineWidgetMainPage(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class InfoLineWidget extends StatelessWidget {
//   final String description;
//   final Widget itemInfo;
//
//   const InfoLineWidget(
//       {Key? key, required this.description, required this.itemInfo})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             description,
//             style: const TextStyle(
//                 color: Color(0xff696974),
//                 fontSize: 14,
//                 fontFamily: 'Gilroy-regular'),
//           ),
//           itemInfo,
//         ],
//       ),
//     );
//   }
// }
//
// class InfoLineIconWidget extends StatelessWidget {
//   final Icon icon;
//   final String text;
//
//   const InfoLineIconWidget({Key? key, required this.icon, required this.text})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         icon,
//         Text(text),
//       ],
//     );
//   }
// }
//
// class AvatarLineWidgetMainPage extends StatelessWidget {
//   const AvatarLineWidgetMainPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: ListView.separated(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           scrollDirection: Axis.horizontal,
//           itemCount: AvatarsList.avatarsList.length,
//           separatorBuilder: (context, index) => const SizedBox(
//             width: 8,
//           ),
//           itemBuilder: (context, index) {
//             return AvatarWidget(index);
//           }),
//     );
//   }
// }
//
// class AvatarWidget extends StatelessWidget {
//   final int index;
//
//   const AvatarWidget(this.index, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       padding: const EdgeInsets.all(4),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(46.0),
//         child: Image.asset(AvatarsList.avatarsList[index]),
//       ),
//     );
//   }
// }
