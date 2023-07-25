// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:co_pilot_testing/widgets/videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<IconData> actionsIcon = [
    Icons.cast_sharp,
    Icons.notifications_outlined,
    Icons.search,
    Icons.account_circle_outlined
  ];
  List<String> categories = [
    "All",
    "Flutter",
    "Dart",
    "Firebase",
    "UI Design",
    "Coding",
    "Web Development",
  ];

  String selectedCategory = "All";

  List videos = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final videosJson = await rootBundle.loadString("assets/data/data.json");
    final videosData = await json.decode(videosJson);
    setState(() {
      videos = videosData["items"];
    });
  }

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView.builder(
          controller: controller,
          itemCount: videos.length,
          itemBuilder: (context, i) {
            return Video(
              video: videos[i],
            );
          }),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return ScrollAppBar(
      controller: controller,
      elevation: 2,
      title: Image.network(
        'https://github.com/codingislove01/flutter-youtube-ui/blob/main/assets/images/logo.png?raw=true',
        height: 20,
        fit: BoxFit.contain,
      ),
      actions: actionsIcon
          .map((iconName) => IconButton(onPressed: () {}, icon: Icon(iconName)))
          .toList(),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                style:
                    TextButton.styleFrom(backgroundColor: Colors.grey.shade200),
                child: Row(
                  children: [
                    Icon(Icons.explore_outlined, color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text('Explore',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SizedBox(
                    height: 30,
                    child: VerticalDivider(
                        thickness: 1, color: Colors.grey.shade300)),
              ),
              Wrap(
                spacing: 5,
                children: categories
                    .map(
                      (category) => FilterChip(
                        showCheckmark: false,
                        label: Text(
                          category,
                          style: TextStyle(
                              color: selectedCategory == category
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        onSelected: (bool value) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        shape: StadiumBorder(),
                        backgroundColor: Colors.grey.shade200,
                        selected: selectedCategory == category,
                        selectedColor: Colors.grey.shade600,
                        labelStyle: TextStyle(color: Colors.black),
                      ), //I was not able to remove the border color from filterchip
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
