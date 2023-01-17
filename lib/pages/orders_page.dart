import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/app_drawer.dart';
import 'package:shop_app/components/order_list_item.dart';
import 'package:shop_app/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orderList = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: ListView.builder(
        itemCount: orderList.itemsCount,
        itemBuilder: (context, index) {
         return OrderListItem(orderList.items[index]);
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
