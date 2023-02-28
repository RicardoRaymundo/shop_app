import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/auth.dart';
import 'package:shop_app/pages/auth_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth authProvider = Provider.of(context);
    return authProvider.isAuth ? ProductsOverviewPage() : AuthPage();
  }
}
