import 'package:aplicaciones_moviles_app/presentation/pages/transactions.dart';
import 'package:flutter/material.dart';
import '../widgets/card_item.dart';
import 'page1.dart';
import 'user_register.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CardItem(
            title: 'Load from JSON file',
            description: 'Go to Page',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page1()),
              );
            },
          ),
          CardItem(
            title: 'API Post Implement',
            description: 'Go to Page',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page2()),
              );
            },
          ),
          CardItem(
            title: 'API Get Implement',
            description: 'Go to Page',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3()),
              );
            },
          ),
        ],
      ),
    );
  }
}
