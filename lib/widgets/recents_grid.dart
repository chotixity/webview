import 'package:flutter/material.dart';

class RecentsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const RecentsGrid(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //restorationId: ,

      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 480,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: (1 / .2),
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card.filled(
          //semanticContainer: ,
          //clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Image.asset(
                  items[index]["image"],
                ),
                const SizedBox(width: 10),
                Text(
                  "Daily Mix ${index + 1}",
                  style: const TextStyle(color: Colors.black),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  tooltip: "Play this music",
                  hoverColor: Colors.green,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
