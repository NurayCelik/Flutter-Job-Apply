import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';
import '../providers/remoteok_provider.dart';

class RemoteCompany extends StatelessWidget {
  //const HomeScreen({ Key? key }) : super(key: key);

  Future<void> _refreshRemote(BuildContext context) async {
    await Provider.of<RemoteokProvider>(context, listen: false)
        .fetchAndSetRemoteok();
  }

  final List<Color> circleColors = [
    Colors.purple.shade200,
    Colors.blue.shade200,
    Colors.green.shade200,
  ];

  Color randomGenerator() {
    return circleColors[new math.Random().nextInt(3)];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: RefreshIndicator(
        onRefresh: () => _refreshRemote(
            context), //CircleAvatar ın random color verdiğimizde ışıltılı olarak gösteriyor.Şu durumda yoksa future builder ile yapılırdı.
        child: Consumer<RemoteokProvider>(
          builder: (ctx, data, child) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.items.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: 5,
                  ), //aralarında boşluk verebiliriz
                  child: Container(
                    height: 20.0,
                    width: (data.items[i].company.length * 10.0) + 10.0,
                    child: Center(child: Text('${data.items[i].company}')),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: randomGenerator(),
                        width: 3,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
