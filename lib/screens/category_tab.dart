// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:session_7_news/models/category_model.dart';
import 'package:session_7_news/screens/category_item.dart';

class CategoryTab extends StatelessWidget {
  CategoryTab({super.key , required this.onClick});

  Function onClick;
  List<CategoryModel> allCategories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Pick your category of interest",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClick(allCategories[index]);
                  },
                  child: CategoryItem(
                    model: allCategories[index],
                    index: index,
                  ),
                );
              },
              itemCount: allCategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
            ),
          ),
        ],
      ),
    );
  }
}
