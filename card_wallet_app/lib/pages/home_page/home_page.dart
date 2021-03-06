import 'package:card_wallet_app/global_widgets/background_welcome_page.dart';
import 'package:card_wallet_app/pages/cards_page/cards_page.dart';
import 'package:card_wallet_app/blocs/bottom_bar_bloc/current_page_bloc.dart';
import 'package:card_wallet_app/pages/home_page/widgets/navigation_bar_item.dart';
import 'package:card_wallet_app/pages/labels_page/labels_page.dart';
import 'package:card_wallet_app/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/main_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<CurrentPageBloc, int>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                const BackgroundWelcomePage(isImageVisible: false),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: width,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(
                    children: [
                      IndexedStack(
                        index: state,
                        children: const [
                          CardsPage(),
                          LabelsPage(),
                          ProfilePage(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.all(20),
              height: width * 0.155,
              decoration: BoxDecoration(
                color: MainColors.commonWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(15),
                    blurRadius: 30,
                    offset: const Offset(0, 10)
                  )
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListView.builder(itemBuilder: itemBuilder, itemCount: 3, scrollDirection: Axis.horizontal,),
            ),
          ),
        );
      },
    );
  }
}

// Container(
// width: width - 32.0,
// height: 60.0,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(28.0),
// color: MainColors.deepBlue,
// ),
// child: Row(
// children: [
// NavigationBarItem(
// index: 0,
// iconData: Icons.credit_card,
// state: state,
// ),
// NavigationBarItem(
// index: 1,
// iconData: Icons.bookmark,
// state: state,
// ),
// NavigationBarItem(
// index: 2,
// iconData: Icons.person,
// state: state,
// ),
// ],
// ),
// ),
