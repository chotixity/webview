import 'package:flutter/material.dart';

class RecentsGrid extends StatelessWidget {
  const RecentsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: List.generate(6, (index) {
        return Card.filled(
          child: ListTile(
            subtitle: Text("Daily Mix ${index + 1}"),
          ),
        );
      }).toList(),
    );
  }
}
