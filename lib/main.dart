import 'package:flutter/material.dart';
import 'screens/contact_list.dart';
import 'screens/grid_example.dart';
import 'screens/shared_pref.dart';
import 'screens/async_screen.dart';
import 'screens/factorial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🎨 THEME MÀU SẮC CHO TOÀN APP
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      home: HomeMenu(),
    );
  }
}

class HomeMenu extends StatelessWidget {
  Widget buildMenuTile(BuildContext context, String title, Widget page) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      color: Colors.teal.withOpacity(0.08),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.teal),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week 4 Exercises"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: [
          buildMenuTile(context, "Exercise 1: ListView Contact", ContactListScreen()),
          buildMenuTile(context, "Exercise 2: Grid View", GridExampleScreen()),
          buildMenuTile(context, "Exercise 3: Shared Preferences", SharedPrefScreen()),
          buildMenuTile(context, "Exercise 4: Async Loading", AsyncScreen()),
          buildMenuTile(context, "Exercise 5: Isolate Factorial", FactorialScreen()),
        ],
      ),
    );
  }
}
