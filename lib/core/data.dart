class Categories {
  final int id;
  final String name;
  final String image;

  Categories({required this.id, required this.name, required this.image});
}

List<Categories> categories = [
  Categories(
      id: 0, name: 'Dinning Food', image: 'assets/icons/chicken-leg.svg'),
  Categories(id: 1, name: 'Sea Food', image: 'assets/icons/fish.svg'),
  Categories(id: 2, name: 'Chinese Food', image: 'assets/icons/pizza.svg'),
  Categories(id: 3, name: 'Fast Food', image: 'assets/icons/cut.svg'),
];

class Food {
  final int id;
  final String title;
  final String name;
  final String withs;
  final String image;
  final String price;
  final String weight;
  final String description;
  final String kal;

  Food({
    required this.id,
    required this.title,
    required this.withs,
    required this.name,
    required this.image,
    required this.price,
    required this.weight,
    required this.description,
    required this.kal,
  });
}

List<Food> foods = [
  Food(
    id: 0,
    name: 'Cooked Veg',
    title: 'Cooked veg with sweet Cookies',
    withs: 'with sweet Cookies',
    image: 'assets/image/01.png',
    price: '\$22',
    weight: '190g',
    description:
        'Get 50% discount on the cooked veg with sweet cookies and stay connected for further discounts',
    kal: '150',
  ),
  Food(
    id: 0,
    name: 'Duck meat',
    title: 'Duck meat with Citrus glaze',
    withs: 'with Citrus glaze',
    image: 'assets/image/02.png',
    price: '\$19',
    weight: '190g',
    description:
        'Get 50% discount on the cooked veg with sweet cookies and stay connected for further discounts',
    kal: '150',
  ),
];
