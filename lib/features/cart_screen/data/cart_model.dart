
import '../../menu_screen/data/menu_model.dart';

class CartItem {
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  int quantity;
  final String category;

  CartItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'category': category,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '0.00',
      imageUrl: map['imageUrl'] ?? '',
      quantity: map['quantity'] ?? 0,
      category: map['category'] ?? '',
    );
  }

  double get totalPrice => double.parse(price) * quantity;
  double get priceAsDouble => double.parse(price);

  CartItem copyWith({
    String? name,
    String? description,
    String? price,
    String? imageUrl,
    int? quantity,
    String? category,
  }) {
    return CartItem(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
    );
  }


  String get id => '${category}_${name.replaceAll(' ', '_').toLowerCase()}';
}


extension MenuItemExtension on MenuItem {
  CartItem toCartItem(String category, {int quantity = 1}) {
    return CartItem(
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      quantity: quantity,
      category: category,
    );
  }

  // Generate a unique identifier
  String getId(String category) => '${category}_${name.replaceAll(' ', '_').toLowerCase()}';
}