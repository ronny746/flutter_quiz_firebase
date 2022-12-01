import 'package:demo_application/quiz_screen.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List category = [
    "G K",
    "Books",
    "Films",
    "Music",
    "Theaters",
    "Television",
    "video Games",
    "Boadr Games",
    "Nature",
    "computers",
    "Math",
    "Mythology",
    "sports",
    "Geography",
    "History",
    "Politics",
    "Art",
    "Celebrities",
    "Animals"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Select Category"))),
      body: ListView.builder(
          itemCount: category.length,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => QuizScreen(cate: "${index+9}"))));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 220, 98, 89),
                      borderRadius: BorderRadius.circular(12)),
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              textAlign: TextAlign.center,
                              category[index].toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
