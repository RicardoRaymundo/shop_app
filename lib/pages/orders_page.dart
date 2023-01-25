import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/app_drawer.dart';
import 'package:shop_app/components/order_list_item.dart';
import 'package:shop_app/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(
              child: Text('Ocorreu um erro'),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () =>
                  Provider.of<OrderList>(context, listen: false).loadOrders(),
              child: Consumer<OrderList>(
                builder: (ctx, orders, child) => ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (context, index) {
                    return OrderListItem(orders.items[index]);
                  },
                ),
              ),
            );
          }
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
