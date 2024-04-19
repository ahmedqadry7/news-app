// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:session_7_news/models/source_response.dart';
import 'package:session_7_news/network/remote/api_manager.dart';
import 'package:session_7_news/screens/news_item.dart';
import 'package:session_7_news/screens/source_item.dart';

class NewsTab extends StatefulWidget {
  List<Sources> sources;
  NewsTab({super.key, required this.sources});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TabBar(
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: widget.sources
                  .map(
                    (e) => Tab(
                      child: SourceItem(
                        isSelected:
                            widget.sources.elementAt(selectedIndex) == e,
                        source: e,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            }
            var articlesList = snapshot.data?.articles ?? [];
            if (articlesList.isEmpty || snapshot.data == null) {
              return Center(
                child: Center(child: Text("No Articles")),
              );
            }
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  return NewsItem(article: articlesList[index]);
                },
                itemCount: articlesList.length,
              ),
            );
          },
        )
      ],
    );
  }
}
