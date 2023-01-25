import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/exceptions/http_exception.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
        backgroundColor: Colors.white,
      ),
      title: Text(product.title),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.productForm, arguments: product);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Produto?'),
                    content: Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: Text('Não'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: Text('Sim'),
                      ),
                    ],
                  ),
                ).then((value) async {
                  try {
                    if (value ?? false) {
                      await Provider.of<ProductList>(context, listen: false)
                          .removeProduct(product);
                    }
                  } on HttpException catch (error) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                        content: Text(error.toString()),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
