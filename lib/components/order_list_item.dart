import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/order.dart';

class OrderListItem extends StatefulWidget {
  const OrderListItem(this.order, {super.key});

  final Order order;

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double itemsHeight = (widget.order.products.length * 25) + 10;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isExpanded ? itemsHeight + 80 : 80,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
              subtitle: Text(
                  DateFormat('dd/MM/yyyy - hh:mm').format(widget.order.date)),
              trailing: IconButton(
                icon: const Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              height: _isExpanded ? itemsHeight : 0,
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: ListView(
                  children: widget.order.products
                      .map((product) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${product.quantity}x R\$ ${product.price}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
