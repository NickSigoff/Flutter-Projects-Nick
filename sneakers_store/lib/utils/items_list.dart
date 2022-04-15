class ItemsList {
  static final List<Items> sneakersList = [
    Items(
        imageName: 'assets/white_sneakers.jpg',
        price: '100',
        name: 'Nike Air Heights',
        id: '0',
        availableSizes: [34, 35, 36, 37, 38]),
    Items(
        imageName: 'assets/krossovki_adidas_superstar.jpg',
        price: '110',
        name: 'Adidas Superstar',
        id: '1',
        availableSizes: [34, 35, 36, 38, 40]),
    Items(
        imageName: 'assets/nike_air_monarch_iv.jpg',
        price: '120',
        name: 'Nike Monarch IV',
        id: '2',
        availableSizes: [34, 35, 36]),
    Items(
        imageName: 'assets/nike_air_height_trainers.jpg',
        price: '130',
        name: 'Nike Air Height Trainers',
        id: '3',
        availableSizes: [34, 35, 36, 40, 42]),
    Items(
        imageName: 'assets/nike_air_max_invigor.jpg',
        price: '140',
        name: 'Nike Air Max Invigor',
        id: '4',
        availableSizes: [34, 39]),
    Items(
        imageName: 'assets/nike_air_max97.jpg',
        price: '150',
        name: 'Nike Air Max97',
        id: '5',
        availableSizes: [34, 43, 47]),
    Items(
        imageName: 'assets/Mdrunnergreen4.jpg',
        price: '160',
        name: 'Nike Md Runner',
        id: '6',
        availableSizes: [34, 35, 36]),
    Items(
        imageName: 'assets/nike_react_vision.jpg',
        price: '170',
        name: 'Nike React Vision',
        id: '7',
        availableSizes: [34, 35, 36, 37, 38, 39]),
    Items(
        imageName: 'assets/nike_tanjun.jpg',
        price: '180',
        name: 'Nike Air Tanjun',
        id: '8',
        availableSizes: [34, 35, 36, 38]),
    Items(
        imageName: 'assets/nike_t-lite_xi.jpg',
        price: '190',
        name: 'Nike T Lite XI',
        id: '9',
        availableSizes: [34, 35, 36, 40, 41]),
  ];
}

class Items {
  final String imageName;
  final String name;
  final String price;
  final String id;
  final String currency;

  bool addedToFavorite;
  List availableSizes;
  int itemCounter;
  bool checkBoxState;

  Items({
    required this.name,
    required this.price,
    required this.imageName,
    required this.id,
    required this.availableSizes,
    this.addedToFavorite = false,
    this.currency = '\$',
    this.checkBoxState = false,
    this.itemCounter = 1,
  });

  void addCounter() {
    itemCounter++;
  }

  void subCounter() {
    itemCounter--;
  }

  int calculatePrice() {
    return int.parse(price) * itemCounter;
  }
}
