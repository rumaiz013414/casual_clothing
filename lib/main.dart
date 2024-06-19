import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'model/product_detail.dart';
import 'model/product.dart';
import 'screens/profile_screen.dart';
import 'screens/cart.dart';
import 'screens/liked_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casuals Clothing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.grey[400],
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey[800],
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system, // Use system theme mode
      initialRoute: '/login',
      routes: {
        '/': (context) => HomeScreen(),
        '/home': (context) => HomeScreen(),
        '/liked': (context) => LikedClothesPage(),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/productDetail': (context) => ProductDetailScreen(
            product: ModalRoute.of(context)!.settings.arguments as Product),
      },
    );
  }
}
