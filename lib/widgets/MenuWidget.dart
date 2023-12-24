import 'package:app1/widgets/MenuItem.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final VoidCallback onClose;

  MenuWidget({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: 10),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          MenuItem(title: 'Home'),
          MenuItem(title: 'Owners'),
          MenuItem(title: 'Product'),
          MenuItem(title: 'Customers'),
          MenuItem(title: 'Analytics'),
          
        ],
      ),
    );
  }
}
