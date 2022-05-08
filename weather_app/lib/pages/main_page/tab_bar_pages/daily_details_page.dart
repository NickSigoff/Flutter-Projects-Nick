import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_forecast.dart';
import '../../../utils/main_colors.dart';
import '../../../utils/main_gradients.dart';
import '../widgets/daily_details_widgets/daily_info_widget.dart';
import '../widgets/daily_details_widgets/daily_list_view_widget.dart';

class DailyDetailsPage extends StatefulWidget {
  const DailyDetailsPage({Key? key}) : super(key: key);

  @override
  State<DailyDetailsPage> createState() => _DailyDetailsPageState();
}

class _DailyDetailsPageState extends State<DailyDetailsPage> {
  int _selectedPage = 0;

  late List<DailyInfoWidget> mainInfoList;

  void _onTapChangePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    final forecast = context.watch<WeatherForecast>().daily!;
    mainInfoList = List.generate(
        forecast.length, (index) => DailyInfoWidget(index: index));
    return Container(
      padding: const EdgeInsets.only(bottom: 140),
      //appbar + tab bar
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: MainGradients.backgroundMainPageGradient,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 4.0,
            pinned: true,
            snap: false,
            stretch: true,
            automaticallyImplyLeading: false,
            collapsedHeight: 60,
            backgroundColor: MainColors.backgroundMainPageLight,
            title: DailyListView(
              onTap: _onTapChangePage,
              selectedPage: _selectedPage,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              mainInfoList[_selectedPage],
            ]),
          ),
        ],
      ),
    );
  }
}
