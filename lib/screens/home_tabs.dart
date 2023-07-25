import 'package:flutter/material.dart';

import 'home.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Builder(
          builder: (context) => const Scaffold(
            bottomNavigationBar: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 10),
              tabs: [
                Tab(height: 60, icon: Icon(Icons.home), text: "Home"),
                Tab(
                    height: 60,
                    icon: Icon(Icons.play_arrow_outlined),
                    text: "Shorts"),
                Tab(
                    height: 60,
                    icon: Icon(Icons.subscriptions_outlined),
                    text: "Subscriptions"),
                Tab(
                    height: 60,
                    icon: Icon(Icons.video_library_outlined),
                    text: "Library"),
              ],
            ),
            body: TabBarView(children: [
              Home(),
              Center(
                child: Text("Shorts"),
              ),
              Center(
                child: Text("Subscriptions"),
              ),
              Center(
                child: Text("Library"),
              ),
            ]),
          ),
        ));
  }
}
