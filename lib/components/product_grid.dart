import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/product_grid_item.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid(
    this.showFavoriteOnly, {
    Key? key,
  }) : super(key: key);

  final bool showFavoriteOnly;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        // Usar o .value para quando já estiver instanciada a classe que tem o mixin com o ChangeNotifier
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: const ProductGridItem(),
        );
      },
    );
  }
}
