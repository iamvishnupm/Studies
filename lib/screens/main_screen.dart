import 'package:flutter/material.dart';
import 'package:todo/widgets/center_feature.dart';
import 'package:todo/screens/profile_screen.dart';
// import 'package:todo/screens/alarm_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    // AlarmScreen(),
    CenterFeature(icon: Icons.access_time, label: "Alarm"),
    CenterFeature(icon: Icons.calendar_today, label: "Calendar"),
    CenterFeature(icon: Icons.checklist, label: "Todo"),
    ProfileScreen(),
  ];

  void _onTap(int idx) => setState(() => _selectedIndex = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        backgroundColor: const Color(0xFF071116),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.access_time), label: 'Alarm'),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          NavigationDestination(icon: Icon(Icons.edit), label: 'Todo'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
