import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RemoteItem extends StatefulWidget {
  final String id;
  final String date;
  final String logo;
  final String position;
  final String location;
  final String description;
  final String company;
  final String tags;
  final int index;
  RemoteItem(
      {this.id,
      this.date,
      this.position,
      this.location,
      this.description,
      this.logo,
      this.company,
      this.tags,
      this.index});

  @override
  _RemoteItemState createState() => _RemoteItemState();
}

class _RemoteItemState extends State<RemoteItem> {
  final dataKey = new GlobalKey();
  String capitalize(String string) {
    if (string == null) {
      throw ArgumentError.notNull('string');
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toLowerCase() + string.substring(1);
  }

  final List<Color> circleColors = [
    Colors.purple.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
  ];

  Color randomGenerator() {
    return circleColors[new Random().nextInt(2)];
  }

  Future<void> _showMyDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        //print("date :::  ${widget.date}");
        var data = widget.date.toString();
        var myData = data.split('T');
        myData[1].trim();

        return Center(
          child: Container(
            margin: EdgeInsets.only(top: 170.0),
            alignment: Alignment.bottomCenter,
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(10.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              content: AnimatedContainer(
                height: widget.description.length * 30.0 + 100,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 0.0,
                                  top: 15.0,
                                  bottom: 15.0),
                              child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(widget.logo),
                                  radius: 20.0),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, right: 50.0),
                              child: Center(
                                  child: Text(
                                widget.company.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.end,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Center(
                                  child: Text(
                                myData[0].toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.end,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ButtonTheme(
                                minWidth: 180.0,
                                height: 100.0,
                                child: OutlinedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                  ),
                                  child: const Text(
                                    "APLY",
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                widget.position.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              )),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              widget.description,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ButtonTheme(
                    minWidth: 180.0,
                    height: 100.0,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                      child: const Text(
                        "EXIT",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.tags.toString();
    var newTag = data.split(',');

    return Column(
      children: [
        GestureDetector(
          onTap: () => _showMyDialog(context),
          child: Card(
            key: dataKey,
            elevation: 3,
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    widget.position.toString(),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    widget.location,
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                  ),
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(widget.logo),
                      radius: 20.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.all(7.0), //aralarında boşluk verebiliriz
                      child: Expanded(
                        child: SizedBox(
                          height: 30.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: newTag.length,
                              padding: EdgeInsets.only(left:65.0,top:0),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  //height: 25.0,
                                  width: newTag[index].length * 8.0,
                                  child: Center(
                                      child:
                                          Text(capitalize('${newTag[index]}'), style: TextStyle(fontSize: 15.0),)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 2,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
