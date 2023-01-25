import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_list.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite(BuildContext context) async {
    _toggleFavorite();

    try {
      await Provider.of<ProductList>(
        context,
        listen: false,
      ).toggleFavoriteProduct(this);
    } catch (error) {
      _toggleFavorite();
      rethrow;
    }
  }
}
