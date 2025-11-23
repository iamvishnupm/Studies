import "package:flutter/material.dart";
import "package:xyz/screens/category_screen.dart";
import "package:xyz/screens/meals_list_screen.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  void _switchTab(int ind) {
    setState(() {
      _index = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = CategoryScreen();

    if (_index == 1) {
      currentScreen = MealsListScreen(mealsList: []);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            //
            _index == 0 ? "Categories" : "Favorites",
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _switchTab,
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        ),
        body: currentScreen,
      ),
    );
  }
}
