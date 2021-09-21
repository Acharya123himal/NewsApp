import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himalsanchar/screens/screens.dart';
import 'package:html/parser.dart';

class ListTileView extends StatelessWidget {
  final List list;
  const ListTileView({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: const Color(0x18181818),
          child: ListTile(
            minLeadingWidth: 100,
            leading: Image.network(
              list[index].image,
            ),
            title: Text(
              parse((list[index].title).toString()).documentElement!.text,
              textAlign: TextAlign.justify,
              style: GoogleFonts.getFont(
                'Copse',
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (context) => ReadNews(index, list: list));
            },
          ),
        );
      },
    );
  }
}
