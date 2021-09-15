import 'package:andre_suplementos/models/admin_users_manager.dart';
import 'package:andre_suplementos/models/cart_manager.dart';
import 'package:andre_suplementos/models/home_manager.dart';
import 'package:andre_suplementos/models/product.dart';
import 'package:andre_suplementos/models/user_manager.dart';
import 'package:andre_suplementos/screens/base/base_screen.dart';
import 'package:andre_suplementos/screens/cart/cart_screen.dart';
import 'package:andre_suplementos/screens/edit_product/edit_product_screen.dart';
import 'package:andre_suplementos/screens/login/login_screen.dart';
import 'package:andre_suplementos/screens/product/product_screen.dart';
import 'package:andre_suplementos/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/product_manager.dart';


void main() {
  runApp(MyApp());


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
          cartManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
          create: (_) => AdminUsersManager(),
          lazy: false,
          update: (_, userManager, adminUsersManager) =>
          adminUsersManager..updateUser(userManager),
        )
      ],
      child: MaterialApp(
        title: 'Sr Suplementos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          // appBarTheme serve para tirar a elevacao da appbar
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                  builder: (_) => LoginScreen()
              );
            case '/signup':
              return MaterialPageRoute(
                  builder: (_) => SignUpScreen()
              );
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(
                      settings.arguments as Product
                  ),
              );
            case '/cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen()
              );
            case '/edit_product':
              return MaterialPageRoute(
                  builder: (_) => EditProductScreen(
                      settings.arguments as Product
                  )
              );
            case '/base':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen()
              );
          }
        },
      ),
    );
  }
}


