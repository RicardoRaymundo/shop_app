import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';
import 'package:shop_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            fontFamily: 'Lato',
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: Colors.purple, secondary: Colors.deepOrange)),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.productDetail:(context) => ProductDetailPage()
        },
      ),
    );
  }
}
