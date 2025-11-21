import "package:flutter/material.dart";
import "package:taskmaster/widgets/center_feature.dart";
import "package:taskmaster/screens/alarm/alarm_tab.dart";
import "package:taskmaster/screens/profile_screen.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  void _onTap(int idx) => setState(() => _index = idx);

  final List<Widget> _pages = [
    AlarmTab(),
    CenterFeature(icon: Icons.calendar_month, label: "Calendar"),
    CenterFeature(icon: Icons.edit, label: "Todo"),
    ProfileScreen(),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _onTap,
        backgroundColor: const Color(0xFF071116),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(icon: Icon(Icons.alarm), label: "Alarm"),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          NavigationDestination(icon: Icon(Icons.edit), label: "Todo"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
