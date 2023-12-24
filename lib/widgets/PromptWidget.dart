import 'package:flutter/material.dart';

class PromptWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Create Products',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            'images/illustration.png',
            height: 150,
          ),
          SizedBox(height: 20),
          Text(
            'Add products to your online shop',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Are you ready to start your online store journey with us? Create new products by clicking the \'Add Products\' button right below and follow the required steps.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "addProductPage");
            },
            child: Text('Add Products'),
          ),
        ],
      ),
    );
  }
}
