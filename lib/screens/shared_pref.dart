import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatefulWidget {
  @override
  _SharedPrefScreenState createState() => _SharedPrefScreenState();
}

class _SharedPrefScreenState extends State<SharedPrefScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();

  String displayText = "Chưa có dữ liệu";

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("name", nameController.text);
    await prefs.setString("email", emailController.text);
    await prefs.setString("age", ageController.text);
    await prefs.setString("timestamp", DateTime.now().toString());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Lưu thành công")),
    );
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    final name = prefs.getString("name");
    final email = prefs.getString("email");
    final age = prefs.getString("age");
    final time = prefs.getString("timestamp");

    setState(() {
      displayText =
          "Tên: $name\nEmail: $email\nTuổi: $age\nLưu lúc: $time";
    });
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() => displayText = "Đã xoá dữ liệu");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Tên"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Tuổi"),
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: saveData, child: Text("Lưu dữ liệu")),
            ElevatedButton(onPressed: loadData, child: Text("Hiện dữ liệu")),
            ElevatedButton(onPressed: clearData, child: Text("Xoá dữ liệu")),

            SizedBox(height: 20),
            Text(displayText, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
