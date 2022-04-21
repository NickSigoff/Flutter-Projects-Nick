abstract class RestaurantsList {
  static final restaurantList = [
    Restaurant(
        name: 'Hookah Place',
        price: 100,
        description: "Unique Egg coffee class with local",
        imageName: 'assets/restaurants/1.jpg',
        rating: 4.7,
        type: "Restaurant",
        opening: '07:30 - 23:00',
        capacity: 15,
        waitingTime: '3-5',
        about:
            'A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you. A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you.'),
    Restaurant(
      name: 'Ember Restaurant & Bar',
      price: 70,
      description: "Unique Egg coffee class with local",
      imageName: 'assets/restaurants/2.jpg',
      rating: 4.5,
      type: "Restaurant",
      opening: '08:30 - 21:00',
      capacity: 20,
      waitingTime: '2-5',
    ),
    Restaurant(
      name: 'Cocktail BarDuck',
      price: 50,
      description: "Unique Egg coffee class with local",
      imageName: 'assets/restaurants/3.jpg',
      rating: 4.5,
      type: "Pub",
      opening: '09:30 - 00:00',
      capacity: 23,
      waitingTime: '3-4',
    ),
    Restaurant(
      name: 'Uno Mas',
      price: 30,
      description: "Unique Egg coffee class with local",
      imageName: 'assets/restaurants/4.jpg',
      rating: 4.7,
      type: "Pub",
      opening: '06:30 - 22:30',
      capacity: 10,
      waitingTime: '1-2',
    ),
    Restaurant(
      name: 'News CAFE',
      price: 30,
      description: "Unique Egg coffee class with local",
      imageName: 'assets/restaurants/5.jpg',
      rating: 4.7,
      type: "Cafe",
      opening: '04:30 - 23:10',
      capacity: 30,
      waitingTime: '1',
    ),
  ];
}

class Restaurant {
  final String name;
  final String type;
  final String imageName;
  final String description;
  final double rating;
  final int price;
  final String opening;
  final int capacity;
  final String waitingTime;
  final String about;
  int stars = 0;

  Restaurant({
    required this.waitingTime,
    required this.capacity,
    required this.opening,
    required this.name,
    required this.price,
    required this.imageName,
    required this.description,
    required this.rating,
    required this.type,
    this.about =
        'A nice quaint cafe with a good view of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep guests company as you.',
  });
}
