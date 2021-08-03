import 'package:flutter/material.dart';
import '../models/remoteok.dart';
import '../screens/remote_detail_screen.dart';

class RemoteSearch extends SearchDelegate<String> {
  final List<RemoteOk> remoteData;
  RemoteSearch({this.remoteData});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  final remoteDataSearchList = query.isEmpty
        ? remoteData
        : remoteData.where((data) {
            return data.position.toString()
                .toLowerCase()
                .startsWith(query.toLowerCase());
          }).toList();
    return ListView.builder(
        itemCount: remoteDataSearchList.length,
        itemBuilder: (context, index) {
         return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RemoteDetailScreen(
                          remoteData: remoteDataSearchList[index])));
            },
            leading: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.network(remoteDataSearchList[index].logo.toString()),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(remoteDataSearchList[index].position.toString()),
            ),
          );
        });
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
