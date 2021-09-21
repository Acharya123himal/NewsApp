import 'package:flutter/material.dart';
import 'package:himalsanchar/helpers/helpers.dart';
import 'package:himalsanchar/screens/screens.dart';
import 'package:himalsanchar/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NetworkHelper _networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _networkHelper.getData(mainurl + "?per_page=10&?_embed"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text(
                  'Loading',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return ListNews(
                list: snapshot.data,
              );
            }
          },
        ),
      ),
    );
  }
}
