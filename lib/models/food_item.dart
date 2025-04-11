// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodItemModel {
  int id;
  String name;
  String image;
  String resturant;
  String foodtype;
  double foodrating;
  int? price;
  List<String>? sizes;
  List<String>? ingredients;
  List<int>? prices;

  FoodItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.resturant,
    required this.foodtype,
    required this.foodrating,
    this.price,
    this.sizes,
    this.ingredients,
    this.prices,
  });

  FoodItemModel copyWith({
    int? id,
    String? name,
    String? image,
    String? resturant,
    String? foodtype,
    double? foodrating,
    int? price,
    List<String>? sizes,
    List<String>? ingredients,
    List<int>? prices,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      resturant: resturant ?? this.resturant,
      foodtype: foodtype ?? this.foodtype,
      foodrating: foodrating ?? this.foodrating,
      price: price ?? this.price,
      sizes: sizes ?? this.sizes,
      ingredients: ingredients ?? this.ingredients,
      prices: prices ?? this.prices,
    );
  }
}
