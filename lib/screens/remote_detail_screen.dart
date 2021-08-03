import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/remoteok.dart';
import './home_screen.dart';

class RemoteDetailScreen extends StatefulWidget {
  static const routeName = '/detail';
  final RemoteOk remoteData;

  RemoteDetailScreen({this.remoteData});
  @override
  _RemoteDetailScreenState createState() => _RemoteDetailScreenState();
}

class _RemoteDetailScreenState extends State<RemoteDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String capitalize(String string) {
    if (string == null) {
      throw ArgumentError.notNull('string');
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.remoteData.date.toString();
    var myDate = data.split('T');
    myDate[1].trim();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.remoteData.company.toString()),
        backgroundColor: Theme.of(context).primaryColor,
        //backgroundColor: Color(0xffe23a81),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0, top: 20.0),
                child: Container(
                  height: 30.0,
                  width: 40.0,
                  child: Image.network(
                    widget.remoteData.companyLogo.toString(),
                    height: 30.0,
                    width: 40.0,
                  ),
                ),
              ),
              footer: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: ListTile(
                    leading: Text(
                      capitalize(widget.remoteData.position.toString()),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    //title:
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, top: 25.0, bottom: 25.0, right: 10.0),
                child: Text(
                  '${myDate[0]}',
                  style: TextStyle(
                      //color: Color(0xffe23a81),
                      color: Colors.black38,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.remoteData.slug.toString()}',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              // ignore: deprecated_member_use
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ButtonTheme(
                  minWidth: 180.0,
                  height: 100.0,
                  child: OutlinedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    child: const Text(
                      "APLY",
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  'Job detail',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              subtitle: Text(widget.remoteData.description.toString()),
            ),
          ),
        ],
      ),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
