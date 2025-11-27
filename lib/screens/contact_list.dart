import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Nguyễn Văn A", "phone": "0123456789"},
    {"name": "Trần Thị B", "phone": "0987654321"},
    {"name": "Lê Văn C", "phone": "0911222333"},
    {"name": "Phạm Thùy D", "phone": "0909090909"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh Bạ"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final item = contacts[index];

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(item["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item["phone"]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ContactDetailScreen(
                      name: item["name"]!,
                      phone: item["phone"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ContactDetailScreen extends StatelessWidget {
  final String name;
  final String phone;

  ContactDetailScreen({required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết liên hệ"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.teal,
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(phone, style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Gọi cho $phone")),
                );
              },
              icon: Icon(Icons.call),
              label: Text("Gọi ngay"),
            ),
          ],
        ),
      ),
    );
  }
}
