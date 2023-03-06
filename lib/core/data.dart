class Categories {
  final int id;
  final String name;
  final String image;

  Categories({required this.id, required this.name, required this.image});
}

List<Categories> categories = [
  Categories(
      id: 0, name: 'Helados de Salcedo', image: 'assets/icons/helado3.svg'),
];

class Food {
  final int id;
  final String title;
  final String name;
  final String withs;
  final String image;
  final String priceperunit;
  final String priceperdozen;
  final String weight;
  final String description;
  final String kal;

  Food({
    required this.id,
    required this.title,
    required this.withs,
    required this.name,
    required this.image,
    required this.priceperunit,
    required this.priceperdozen,
    required this.weight,
    required this.description,
    required this.kal,
  });
}

List<Food> foods = [
  Food(
    id: 0,
    name: 'Helado',
    title: 'Helado de Salcedo',
    withs: 'de leche con mora, naranjilla y taxo',
    image: 'assets/image/helado01.png',
    priceperunit: '\$ 0.50',
    priceperdozen: '\$ 6',
    weight: '120g',
    description:
        'HELADO TOTAL: Fracción Leche; Fracción Mora ; Fracción naranjilla: fracción taxo.',
    kal: '725',
  ),
  Food(
    id: 0,
    name: 'Helado',
    title: 'Paleta de sabores',
    withs: 'De chocolate y menta',
    image: 'assets/image/helado03.png',
    priceperunit: '\$ 0.50',
    priceperdozen: '\$ 6',
    weight: '120g',
    description:
        'HELADO TOTAL: Fracción Leche; Fracción Mora ; Fracción naranjilla: fracción taxo.',
    kal: '150',
  ),
];
