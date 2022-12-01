import 'package:demo_application/profile.dart';
import 'package:demo_application/quiz_category.dart';
import 'package:flutter/material.dart';

class TabBarBottom extends StatefulWidget {
  const TabBarBottom({super.key});

  @override
  State<TabBarBottom> createState() => _TabBarBottomState();
}

class _TabBarBottomState extends State<TabBarBottom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          
          bottomNavigationBar: menu(),
          body: const TabBarView(
            children: [
             CategoryPage(),
             ProfilePage()
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: const Color(0xFF3F5AA6),
      child: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "Category",
            icon: Icon(Icons.category),
          ),
          Tab(
            text: "Profile",
            icon: Icon(Icons.person),
          ),
         
        ],
      ),
    );
  }
}
