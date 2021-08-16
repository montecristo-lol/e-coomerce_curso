import 'package:andre_suplementos/models/cart_product.dart';
import 'package:andre_suplementos/models/product.dart';

class CartManager {

  List<CartProduct> items = [];

  void addToCart(Product product){
    items.add(CartProduct.fromProduct(product));
  }

}