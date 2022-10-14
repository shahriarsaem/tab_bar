import 'package:flutter/material.dart';
import 'package:tab_bar/page.dart';
import 'package:tab_bar/page2.dart';
import 'package:tab_bar/page3.dart';
import 'package:tab_bar/page4.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;

  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12)),
              child: TabBar(
                controller: tabController,
                onTap: (index) {
                  setState(() {
                    tabController!.index = index;
                  });
                },
                tabs: [
                  Tab(
                    text: "Page1",
                  ),
                  Tab(
                    text: "Page2",
                  ),
                  Tab(
                    text: "Page3",
                  ),
                  Tab(
                    text: "Page4",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [Page1(), Page2(), Page3(), Page4()]),
            )
          ],
        ),
      ),
    );
  }
}
