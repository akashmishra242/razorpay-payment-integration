import 'package:flutter/material.dart';
import '../models/fetch_all_model.dart';

class ListWidget extends StatelessWidget {
  final List<Item> items;
  const ListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
