import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:himalsanchar/utility/utility.dart';
import 'package:html/parser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../strings.dart';

class ReadNews extends StatefulWidget {
  final int id;
  final List list;
  const ReadNews(this.id, {Key? key, required this.list}) : super(key: key);

  @override
  State<ReadNews> createState() => _ReadNewsState();
}

class _ReadNewsState extends State<ReadNews> {
  bool floatButtonVisibility = false;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      listenScroll();
    });
  }
  @override
void dispose() {
  _controller.dispose();
  super.dispose();
}

  void listenScroll() {
    if (_controller.keepScrollOffset) {
      if (_controller.position.pixels <-200) {
        Navigator.pop(context);
        dispose();
      }
      if (_controller.position.pixels == 0) {
        setState(() {
          floatButtonVisibility = false;
        });
      }else {
        setState(() {
          floatButtonVisibility = true;
        });
      }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controller,
        child: Hero(
          tag: 'hero$postIndex',
          child: Column(
            children: [
              ClipPath(
                clipper: MyCustomClipper(),
                child: Image.network(
                  widget.list[postIndex].image,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Text(
                    parse((widget.list[postIndex].title).toString())
                        .documentElement!
                        .text,
                    style: GoogleFonts.getFont(
                      'Modern Antiqua',
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white38,
                      child: SvgPicture.network(
                        'https://avatars.dicebear.com/api/avataaars/Acharya123himal.svg',
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.list[postIndex].author,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      TimeAgo(widget.list[postIndex].postedTime).get(),
                      style: GoogleFonts.getFont(
                        'Modern Antiqua',
                        fontSize: 18,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Divider(
                  color: Colors.white10,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  parse((widget.list[postIndex].content).toString())
                      .documentElement!
                      .text,
                  style: GoogleFonts.getFont(
                    'Snippet',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: floatButtonVisibility,
        child: FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: () {
              _controller.animateTo(
                1,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOutBack,
              );
            },
            child: const Icon(FontAwesomeIcons.arrowUp)),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height + 10);
    var firstStart = Offset(0, size.height - 25);
    var firstEnd = Offset(size.width / 8, size.height - 25);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width - (size.width / 8), size.height - 25);

    var secondStart = Offset(size.width, size.height - 25);
    var secondEnd = Offset(size.width, size.height + 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
