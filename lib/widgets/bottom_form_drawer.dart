import 'package:flutter/material.dart';

class BottomFormDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Sign in',
            style: Theme.of(context).textTheme.title,
          ),
          
        ],
      ),
    );
  }
}