import 'package:flutter/material.dart';
import 'package:himalsanchar/widgets/grid_tile.dart';
import 'package:himalsanchar/widgets/list_tile.dart';

class ListNews extends StatefulWidget {
  final List list;
  const ListNews({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  bool gridView = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  gridView = true;
                });
              },
              child: const Icon(
                Icons.grid_view_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  gridView = false;
                });
              },
              child: const Icon(
                Icons.list_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            child: gridView == true
                ? GridTileView(
                    list: widget.list,
                  )
                : ListTileView(
                    list: widget.list,
                  ),
          ),
        ),
      ],
    );
  }
}
