// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:session_7_news/network/remote/api_manager.dart';
import 'package:session_7_news/screens/news_tab.dart';

class DataTab extends StatelessWidget {
  String categoryId;
  DataTab({super.key , required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: ApiManager.getSources(categoryId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            }
            var sourcesList = snapshot.data?.sources ?? [];
            if (sourcesList.isEmpty) {
              return Center(
                child: Text("No Sources"),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NewsTab(sources: sourcesList),
            );
          },
        );
  }
}