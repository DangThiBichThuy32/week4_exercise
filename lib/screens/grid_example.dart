import 'package:flutter/material.dart';

class GridExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),

            Text("Fixed Column Grid",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
              children: List.generate(12, (index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Bạn chọn Item ${index + 1}")),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apps, size: 40, color: Colors.teal),
                        SizedBox(height: 8),
                        Text("Item ${index + 1}"),
                      ],
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 20),

            Text("Responsive Grid",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            GridView.extent(
              maxCrossAxisExtent: 160,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
              children: List.generate(12, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 40, color: Colors.orange),
                      SizedBox(height: 8),
                      Text("Item ${index + 1}")
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
