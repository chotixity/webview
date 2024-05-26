import 'package:flutter/material.dart';

class RecentsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const RecentsGrid(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the maxCrossAxisExtent dynamically
        double maxCrossAxisExtent = constraints.maxWidth / 2;
        bool responsive = constraints.maxWidth < 600;
        double childAspectRatio = constraints.maxWidth < 600 ? 2.5 : (1 / .2);

        return GridView.builder(
          //padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxCrossAxisExtent,
            mainAxisSpacing: responsive ? 4 : 8,
            crossAxisSpacing: responsive ? 2 : 8,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: constraints.maxWidth < 600
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      //scale: re
                      items[index]["image"],
                      width: responsive ? 60 : null,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                    constraints.maxWidth < 600
                        ? const SizedBox(width: 10)
                        : const SizedBox(
                            width: 0,
                          ),
                    Text(
                      "Daily Mix ${index + 1}",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    constraints.maxWidth < 600
                        ? const SizedBox(width: 10)
                        : const Expanded(
                            child: SizedBox(
                                //width: 0,
                                ),
                          ),
                    IconButton(
                      tooltip: "Play this music",
                      hoverColor: Colors.green,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
