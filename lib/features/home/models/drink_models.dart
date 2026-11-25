class DrinkModel {
  final String name;
  final int price;
  int stock;

  DrinkModel({required this.name, required this.price, required this.stock});

  bool get isOutOfStock => stock <= 0;
}
