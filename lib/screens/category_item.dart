// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:session_7_news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  int index;
  CategoryItem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
          bottomRight: index.isEven ? Radius.circular(28) : Radius.zero,
          bottomLeft: index.isOdd ? Radius.circular(28) : Radius.zero,
        ),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Container(
            margin: EdgeInsets.only(bottom: 18),
            child: Text(
              model.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
