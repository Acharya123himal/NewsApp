import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himalsanchar/screens/read_news.dart';
import 'package:himalsanchar/strings.dart';
import 'package:html/parser.dart';

class GridTileView extends StatelessWidget {
  final List list;
  const GridTileView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
            postIndex = index;
            showBottomSheet(
                context: context,
                builder: (context) => ReadNews(index, list: list));
          },
          child: Card(
            color: const Color(0x18181818),
            child: GridTile(
              child: Column(
                children: [
                  Hero(
                    tag: 'hero$postIndex',
                    child: Image.network(
                      list[index].image,
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.width/4.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    parse((list[index].title).toString())
                        .documentElement!
                        .text,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.getFont(
                      'Copse',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
