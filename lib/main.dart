import 'package:flutter/material.dart';
import 'package:shop_app/pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.deepOrange)),
      home: ProductsOverviewPage(),
    );
  }
}
