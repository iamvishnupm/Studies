import "package:flutter/material.dart";
import "package:taskmaster/screens/main_screen.dart";
import "package:taskmaster/state/session_manager.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SessionManager.load();
  runApp(TaskMaster());
}

class TaskMaster extends StatelessWidget {
  const TaskMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TaskMaster",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0F1720),
        // canvasColor: Colors.black,
      ),
      home: MainScreen(),
    );
  }
}
