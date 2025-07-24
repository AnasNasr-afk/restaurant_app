// cubits/menu_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../cart_screen/data/cart_model.dart';
import '../data/menu_model.dart';
import 'menu_states.dart';


class MenuCubit extends Cubit<MenuStates> {
  MenuCubit() : super(MenuInitialState());

  static MenuCubit get(context) => BlocProvider.of(context);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  List<CartItem> cartItems = [];
  double totalAmount = 0.0;
  int totalItemsCount = 0;

  // Get cart items from Firebase
  Future<void> loadCartItems() async {
    try {
      emit(CartLoadingState());

      final snapshot = await _firestore
          .collection('cart')
          .doc('user_cart') // In a real app, use user ID
          .collection('items')
          .get();

      cartItems = snapshot.docs
          .map((doc) => CartItem.fromMap(doc.data()))
          .toList();

      _calculateTotals();
      emit(CartUpdatedState());
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  // Add item to cart
  Future<void> addToCart(MenuItem menuItem, String category) async {
    try {
      emit(CartLoadingState());

      final itemId = menuItem.getId(category);

      // Check if item already exists in cart
      final existingItemIndex = cartItems.indexWhere((item) => item.id == itemId);

      if (existingItemIndex != -1) {
        // Update quantity
        cartItems[existingItemIndex] = cartItems[existingItemIndex].copyWith(
          quantity: cartItems[existingItemIndex].quantity + 1,
        );
      } else {
        // Add new item
        cartItems.add(menuItem.toCartItem(category));
      }

      // Update Firebase
      await _updateCartInFirebase();
      _calculateTotals();
      emit(CartUpdatedState());
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  // Remove item from cart
  Future<void> removeFromCart(String itemId) async {
    try {
      emit(CartLoadingState());

      final existingItemIndex = cartItems.indexWhere((item) => item.id == itemId);

      if (existingItemIndex != -1) {
        if (cartItems[existingItemIndex].quantity > 1) {
          // Decrease quantity
          cartItems[existingItemIndex] = cartItems[existingItemIndex].copyWith(
            quantity: cartItems[existingItemIndex].quantity - 1,
          );
        } else {
          // Remove item completely
          cartItems.removeAt(existingItemIndex);
        }

        // Update Firebase
        await _updateCartInFirebase();
        _calculateTotals();
        emit(CartUpdatedState());
      }
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  // Clear entire cart
  Future<void> clearCart() async {
    try {
      emit(CartLoadingState());

      cartItems.clear();

      // Clear Firebase
      await _firestore
          .collection('cart')
          .doc('user_cart')
          .collection('items')
          .get()
          .then((snapshot) {
        for (DocumentSnapshot doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      _calculateTotals();
      emit(CartUpdatedState());
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  // Update cart in Firebase
  Future<void> _updateCartInFirebase() async {
    final batch = _firestore.batch();
    final cartRef = _firestore.collection('cart').doc('user_cart').collection('items');

    // Clear existing items
    final existingItems = await cartRef.get();
    for (var doc in existingItems.docs) {
      batch.delete(doc.reference);
    }

    // Add current cart items
    for (var item in cartItems) {
      batch.set(cartRef.doc(item.id), item.toMap());
    }

    await batch.commit();
  }

  // Calculate totals
  void _calculateTotals() {
    totalAmount = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
    totalItemsCount = cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  // Get quantity of specific item in cart
  int getItemQuantity(MenuItem menuItem, String category) {
    final itemId = menuItem.getId(category);
    final item = cartItems.firstWhere(
          (item) => item.id == itemId,
      orElse: () => CartItem(
        name: '',
        description: '',
        price: '0.00',
        imageUrl: '',
        quantity: 0,
        category: '',
      ),
    );
    return item.quantity;
  }

  // Check if item is in cart
  bool isItemInCart(MenuItem menuItem, String category) {
    final itemId = menuItem.getId(category);
    return cartItems.any((item) => item.id == itemId);
  }
}