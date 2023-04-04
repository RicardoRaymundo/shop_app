import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/auth.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/order_list.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/pages/auth_or_home_page.dart';
import 'package:shop_app/pages/auth_page.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/orders_page.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/pages/product_form_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';
import 'package:shop_app/pages/products_page.dart';
import 'package:shop_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        // Proxy Provider para providers que dependem de outros
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, authProvider, previous) {
            return ProductList(
              authProvider.getToken ?? '',
              authProvider.getUid ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, authProvider, previous) {
            return OrderList(
              authProvider.getToken ?? '',
              authProvider.getUid ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.deepOrange),
        ),
        routes: {
          AppRoutes.authOrHome: (context) => AuthOrHomePage(),
          AppRoutes.productDetail: (context) => ProductDetailPage(),
          AppRoutes.cart: (context) => CartPage(),
          AppRoutes.orders: (context) => OrdersPage(),
          AppRoutes.products: (context) => ProductsPage(),
          AppRoutes.productForm: (context) => ProductFormPage(),
        },
      ),
    );
  }
}
