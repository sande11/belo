class Product {
  String name;
  String price;
  List<String> imagePaths;  // List to hold multiple images
  String description;
  List<String> sizes;
  List<String> colors;
  int quantity;  // Quantity of the item available
  bool isAvailable;  // Availability status based on quantity

  Product({
    required this.name,
    required this.price,
    required this.imagePaths,  // Updated to hold multiple images
    required this.description,
    required this.sizes,
    required this.colors,
    required this.quantity,
    required this.isAvailable,
  });

  // Factory method to fetch from Firestore
  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      name: data['name'],
      price: data['price'],
      imagePaths: List<String>.from(data['imagePaths']),  // List of images
      description: data['description'],
      sizes: List<String>.from(data['sizes']),
      colors: List<String>.from(data['colors']),
      quantity: data['quantity'],
      isAvailable: data['quantity'] > 0,  // Availability based on quantity
    );
  }

  // Method to check availability
  void updateAvailability() {
    isAvailable = quantity > 0;
  }
}
