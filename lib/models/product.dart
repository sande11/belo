class Product {
  String id; // Firebase document ID (if needed)
  String availability;
  String category;
  String description;
  List<String> images; // List of image URLs
  String name;
  double price;
  int quantityAvailable;
  String section;
  List<Variant> variants;

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

class Variant {
  String color;
  int quantity;
  String size;
  List<String> images; // Variant-specific images

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
