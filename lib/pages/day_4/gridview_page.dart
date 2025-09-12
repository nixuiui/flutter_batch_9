import 'package:flutter/material.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({super.key});

  @override
  State<GridviewPage> createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gridview Page'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Icon(Icons.home, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Icon(Icons.ac_unit, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Icon(Icons.pages, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Icon(Icons.ac_unit, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.orange,
            child: const Center(
              child: Icon(Icons.ac_unit, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.purple,
            child: const Center(
              child: Icon(Icons.ac_unit, color: Colors.white),
            ),
          ),
        ],
      )
    );
  }
}