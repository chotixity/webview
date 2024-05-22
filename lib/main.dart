import 'package:flutter/material.dart';
import 'package:webview/recents_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            titleMedium: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
            bodyMedium: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 16,
            )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List labels = ["Playlists", "Artists", "Albums", "Podcasts & Shows"];

  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 5,
      //   backgroundColor: Colors.blue,
      //   leading: const Icon(
      //     Icons.headset,
      //     size: 50,
      //   ),
      //   title: const Text("Listen all you want"),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.settings,
      //         size: 50,
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.sizeOf(context).width * 0.25,
              height: MediaQuery.sizeOf(context).height * 0.95,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(15),
                  topStart: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 5,
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.home_filled,
                                  size: 50,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                const Text(
                                  "search",
                                  //style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.search_outlined,
                                  size: 50,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                Text(
                                  "Home",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Card(
                    elevation: 5,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.library_books,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          title: Text(
                            "Your Library",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 5,
                          children: List.generate(
                            4,
                            (index) {
                              return ChoiceChip(
                                label: Text(
                                  labels[index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                selected: _value == index,
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = selected ? index : null;
                                  });
                                },
                              );
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).longestSide * .02,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height * .95,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                child: const Column(
                  children: [Expanded(child: RecentsGrid())],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
