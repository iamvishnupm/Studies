import "package:flutter/material.dart";
import "package:taskmaster/screens/alarm/set_alarm_screen.dart";
import "package:taskmaster/screens/alarm/alarm_screen.dart";

class AlarmTab extends StatefulWidget {
  const AlarmTab({super.key});

  @override
  State<AlarmTab> createState() => AlarmTabState();
}

class AlarmTabState extends State<AlarmTab> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case "/set":
            page = SetAlarmScreen();
            break;
          case "/":
          default:
            page = AlarmScreen(
              setAlarm: () {
                //
                _navigatorKey.currentState!.pushNamed("/set");
              },
            );
        }

        // return CupertinoPageRoute(builder: (_) => page);
        // return PageRouteBuilder(
        //   opaque: true,
        //   pageBuilder: (_, __, ___) => page,
        // );

        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
