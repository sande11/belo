
import 'package:hive/hive.dart';

part 'product.g.dart'; // Required for the generated code

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  String id;

  @HiveField(1)
  String availability;

  @HiveField(2)
  String category;

  @HiveField(3)
  String description;

  @HiveField(4)
  List<String> images;

  @HiveField(5)
  String name;

  @HiveField(6)
  double price;

  @HiveField(7)
  int quantityAvailable;

  @HiveField(8)
  String section;

  @HiveField(9)
  List<Variant> variants;
  @HiveField(10)
  String? selectedSize;

  @HiveField(11)
  String? selectedColor;

  Product({
    required this.id,
    required this.availability,
    required this.category,
    required this.description,
    required this.images,
    required this.name,
    required this.price,
    required this.quantityAvailable,
    required this.section,
    required this.variants,
    this.selectedSize,
    this.selectedColor,
  });

  // Factory method to create a Product from Firebase JSON
  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
      id: id,
      availability: map['availability'],
      category: map['category'] ?? 'unkwon',
      description: map['description'],
      images: List<String>.from(map['images']),
      name: map['name'],
      price: map['price'].toDouble(),
      quantityAvailable: map['quantityAvailable'],
      section: map['section'],
      variants: (map['variants'] as List)
          .map((variantMap) => Variant.fromMap(variantMap))
          .toList(),
    );
  }

  // Convert a Product back to JSON
  Map<String, dynamic> toMap() {
    return {
      'availability': availability,
      'category': category,
      'description': description,
      'images': images,
      'name': name,
      'price': price,
      'quantityAvailable': quantityAvailable,
      'section': section,
      'variants': variants.map((v) => v.toMap()).toList(),
    };
  }
}

@HiveType(typeId: 1)
class Variant {
  @HiveField(0)
  String color;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  String size;

  @HiveField(3)
  List<String> images;

  Variant({
    required this.color,
    required this.quantity,
    required this.size,
    required this.images,
  });

  // Factory method to create Variant from Firebase JSON
  factory Variant.fromMap(Map<String, dynamic> map) {
    return Variant(
      color: map['color'],
      quantity: map['quantity'],
      size: map['size'] ?? 'Unknown Size',
      images: List<String>.from(map['images'] ?? []), // If images exist
    );
  }

  // Convert a Variant back to JSON
  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'quantity': quantity,
      'size': size,
      'images': images,
    };
  }
}
