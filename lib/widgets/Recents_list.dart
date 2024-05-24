import 'package:flutter/material.dart';

class RecentsList extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const RecentsList(this.items, {super.key});

  @override
  State<RecentsList> createState() => _RecentsListState();
}

class _RecentsListState extends State<RecentsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.items.length,
        (int index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                Image.asset(widget.items[index]["image"]),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.items[index]["title"]),
                    Text(widget.items[index]["type"]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
