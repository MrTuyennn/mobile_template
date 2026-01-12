import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> lsItem = [];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemCount: lsItem.length,
                    itemBuilder: (_, index) {
                      return ColoredBox(
                        color: Colors.amberAccent,
                        child: Row(
                          children: [
                            Text(lsItem[index].toString()),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  lsItem.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.close),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  lsItem[index] = 2;
                                });
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  lsItem.add(1);
                });
              },
              child: Container(
                color: Colors.cyan,
                height: 100,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
