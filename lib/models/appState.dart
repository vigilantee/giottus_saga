import 'package:meta/meta.dart';
import 'package:shopping_cart/models/cart_status.dart';
import 'products.dart';
import 'cart.dart';
import 'time.dart';

@immutable
class AppState {
  final Products products;
  final Cart cart;
  final CartStatus cartStatus;
  final Time time;

  const AppState({
    required this.products,
    required this.cart,
    required this.cartStatus,
    required this.time,
  });

  factory AppState.initial() {
    return AppState(
      products: Products.initial(),
      cart: Cart.initial(),
      cartStatus: CartStatus.initial(),
      time: Time.initial(),
    );
  }

  AppState copyWith(
      {Products? products, Cart? cart, CartStatus? cartStatus, Time? time}) {
    return AppState(
      products: products ?? this.products,
      cart: cart ?? this.cart,
      cartStatus: cartStatus ?? this.cartStatus,
      time: time ?? this.time,
    );
  }

  @override
  int get hashCode => products.hashCode ^ cart.hashCode ^ cartStatus.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          products == other.products &&
          cart == other.cart &&
          cartStatus == other.cartStatus;
}
