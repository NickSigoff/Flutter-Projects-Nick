abstract class ListParameters {
  static final List<String> imageNames = [
    'assets/images/start_icon.png',
    'assets/images/welcome_images/night.png',
    'assets/images/welcome_images/sun.png',
    'assets/images/welcome_images/rain.png',
    'assets/images/welcome_images/sun_cloud.png',
  ];

  static final List<String> topText = [
    'Detailed Hourly Forecast',
    'Real-Time Weather Map',
    'Weather Around the World',
    'Detailed Hourly Forecast',
  ];

  static final List<String> bottomText = [
    'Get in - depth weather information',
    'Watch the progress of the precipiation to stay informed',
    'Add any location you want and swipe easily to change',
    'Get in - depth weather information',
  ];

  static List<PageInfoHolder> slidesPages = List<PageInfoHolder>.generate(
    4,
    (index) => PageInfoHolder(
        bottomText: bottomText[index],
        topText: topText[index],
        image: imageNames[index],
        percent: (index + 1) * 0.25),
  );
}

class PageInfoHolder {
  final String image;
  final String topText;
  final String bottomText;
  final double percent;

  PageInfoHolder(
      {required this.bottomText,
      required this.topText,
      required this.image,
      required this.percent});
}

abstract class Info {}
