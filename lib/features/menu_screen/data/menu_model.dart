import 'package:restaurant_app/core/constants/constants.dart';

import '../../cart_screen/data/cart_model.dart';

class MenuItem {
  final String name;
  final String description;
  final String price;
  final int rating;
  final bool popular;
  final String imageUrl;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.popular,
    required this.imageUrl,
  });

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '0.00',
      rating: map['rating'] ?? 0,
      popular: map['popular'] ?? false,
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'rating': rating,
      'popular': popular,
      'imageUrl': imageUrl,
    };
  }
}


class MenuCategory {
  final String name;
  final List<MenuItem> items;

  MenuCategory({
    required this.name,
    required this.items,
  });
}

class MenuData {
  static const List<String> categories = [
    "Steaks",
    "Appetizers",
    "Sides",
    "Desserts",
    "Beverages"
  ];

  static List<MenuItem> getMenuItemsByCategory(String category) {
    switch (category) {
      case "Steaks":
        return [
          MenuItem(
            name: 'Prime Ribeye Steak',
            description: '16oz prime cut ribeye, perfectly marbled and grilled to perfection',
            price: '48.00',
            rating: 5,
            popular: true,
            imageUrl: primeRibeyeSteakImage,
          ),
          MenuItem(
            name: 'Wagyu Beef Tenderloin',
            description: 'Premium Japanese wagyu, butter-soft texture with rich flavor',
            price: '85.00',
            rating: 5,
            popular: false,
            imageUrl: wagyuBeefTenderloinImage,
          ),
          MenuItem(
            name: 'New York Strip',
            description: '14oz NY strip steak with herb butter and roasted garlic',
            price: '42.00',
            rating: 4,
            popular: true,
            imageUrl: newYorkStripImage,
          ),
        ];
      case "Appetizers":
        return [
          MenuItem(
            name: 'Jumbo Shrimp Cocktail',
            description: 'Fresh jumbo shrimp served with house cocktail sauce',
            price: '18.00',
            rating: 4,
            popular: true,
            imageUrl: jumboShrimpCocktailImage,
          ),
          MenuItem(
            name: 'Crispy Calamari',
            description: 'Golden fried calamari rings with marinara and aioli',
            price: '14.00',
            rating: 4,
            popular: false,
            imageUrl: crispyCalamariImage,
          ),
        ];
      case "Sides":
        return [
          MenuItem(
            name: 'Truffle Mac & Cheese',
            description: 'Creamy mac and cheese with black truffle shavings',
            price: '16.00',
            rating: 5,
            popular: true,
            imageUrl: truffleMacAndCheeseImage,
          ),
          MenuItem(
            name: 'Garlic Parmesan Fries',
            description: 'Hand-cut fries with garlic, parmesan, and herbs',
            price: '12.00',
            rating: 4,
            popular: false,
            imageUrl: garlicParmesanFriesImage,
          ),
        ];
      case "Desserts":
        return [
          MenuItem(
            name: 'Chocolate Lava Cake',
            description: 'Warm chocolate cake with molten center and vanilla ice cream',
            price: '12.00',
            rating: 5,
            popular: true,
            imageUrl: chocolateLavaCakeImage,
          ),
          MenuItem(
            name: 'NY Cheesecake',
            description: 'Classic New York style cheesecake with berry compote',
            price: '10.00',
            rating: 4,
            popular: false,
            imageUrl: nYCheesecakeImage,
          ),
        ];
      case "Beverages":
        return [
          MenuItem(
            name: 'Fresh Mint Lemonade',
            description: 'Refreshing blend of lemon, mint, and a touch of sugar',
            price: '6.50',
            rating: 5,
            popular: true,
            imageUrl: freshMintLemonadeImage,
          ),
          MenuItem(
            name: 'Saudi Qahwa (Arabic Coffee)',
            description: 'Lightly roasted Arabic coffee with cardamom and dates',
            price: '5.00',
            rating: 5,
            popular: false,
            imageUrl: coffeeImage,
          ),
          MenuItem(
            name: 'Sparkling Citrus Soda',
            description: 'Chilled soda infused with citrus zest and a hint of lime',
            price: '4.00',
            rating: 4,
            popular: false,
            imageUrl: sparklingCitrusSodaImage,
          ),
        ];
      default:
        return [];
    }
  }
}


