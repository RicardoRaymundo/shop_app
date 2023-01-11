import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(this.cartItem, {super.key});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cartItem.price}'),
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text(
              'Total R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
          trailing: Text('${cartItem.quantity}x'),
        ),
      ),
    );
  }
}
