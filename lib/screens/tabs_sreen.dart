import 'package:flutter/material.dart';
import 'package:navegacao/screens/categories_screen.dart';
import 'package:navegacao/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [CategoriesScreen(), FavoriteScreen()];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vamos Cozinhar?',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ]),
    );
  }
}
