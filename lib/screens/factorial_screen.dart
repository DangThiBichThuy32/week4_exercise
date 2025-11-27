import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

int factorialCompute(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result = (result * i) % 1000000007;
  }
  return result;
}

class FactorialScreen extends StatefulWidget {
  @override
  _FactorialScreenState createState() => _FactorialScreenState();
}

class _FactorialScreenState extends State<FactorialScreen> {
  String result = "Chưa tính";

  Future<void> calculate() async {
    setState(() => result = "Đang tính...");
    final value = await compute(factorialCompute, 30000);
    setState(() => result = "Kết quả: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Factorial Isolate"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(result, textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calculate, child: Text("Compute 30000!")),
          ],
        ),
      ),
    );
  }
}
