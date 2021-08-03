import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/remote_company.dart';
import '../widgets/remote_item.dart';
import '../delegates/remote_search.dart';
import '../providers/remoteok_provider.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<RemoteokProvider>(context).fetchAndSetRemoteok();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshRemote(BuildContext context) async {
    await Provider.of<RemoteokProvider>(context, listen: false)
        .fetchAndSetRemoteok();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final remoteData = Provider.of<RemoteokProvider>(context);
    remoteData.fetchAndSetRemoteok();
    return Scaffold(
      /* extendBodyBehindAppBar: true,
       appBar: AppBar(
        toolbarHeight: 200.0,
          title://Image.asset('assets/images/computer.jpg', fit: BoxFit.cover,width: double.infinity,), 
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                  Image.asset(
                 'assets/images/computer.jpg',
                  fit: BoxFit.contain,
                  height: 200.0,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), /* child: Text('YourAppTitle') */ //)
           // ],

         // ), 
     // ), */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(0.0)),
          Container(
            padding: const EdgeInsets.all(0.0),
            /* child: Text('YourAppTitle') */
            margin: const EdgeInsets.all(0.0),
            width: 400.0,
            height: 200.0,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage(
                'assets/images/computer.jpg',
              ),
              fit: BoxFit.fitWidth,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: RemoteSearch(
                              remoteData: Provider.of<RemoteokProvider>(context,
                                      listen: false)
                                  .items),
                        );
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RemoteCompany(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => _refreshRemote(context),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: remoteData.items.length,
                  itemBuilder: (_, i) {
                    print("id :::  ${remoteData.items[i].id}");
                    print("date :::  ${remoteData.items[i].date}");
                    print("applyUrl :::  ${remoteData.items[i].applyUrl}");
                    print("location :::  ${remoteData.items[i].location}");
                    print("position :::  ${remoteData.items[i].position}");
                    print("epoch :::  ${remoteData.items[i].epoch}");
                    print("tags :::  ${remoteData.items[i].tags}");
                    print("slug :::  ${remoteData.items[i].slug}");
                    print("logo :::  ${remoteData.items[i].logo}");
                    print("length :::  ${remoteData.items.length}");
                    //i +=1;
                    return RemoteItem(
                        id: remoteData.items[i].id,
                        date: remoteData.items[i].date.toString(),
                        logo: remoteData.items[i].logo.toString(),
                        position: remoteData.items[i].position.toString(),
                        location: remoteData.items[i].location.toString(),
                        description: remoteData.items[i].description.toString(),
                        company: remoteData.items[i].company.toString(),
                        tags: remoteData.items[i].tags.toString(),
                        index: i);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
