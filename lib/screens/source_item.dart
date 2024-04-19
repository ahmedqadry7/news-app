// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:session_7_news/models/source_response.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceItem({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        border: Border.all(color: Colors.green, width: 3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        textAlign: TextAlign.center,
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
