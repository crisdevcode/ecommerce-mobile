import 'package:delivery_ecommerce/pages/home/main_food_page.dart';
import 'package:delivery_ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // WHATS
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List pages = [
    MainFoodPage(),
    Text('next page 2'),
    Text('next page 3'),
    Text('next page 4'),
  ];

  void onTabNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.signColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: onTabNav,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: 'Historial',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrito',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Mi Perfil',
            ),
          ]),
    );
  }
}