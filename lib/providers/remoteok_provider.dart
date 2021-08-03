import 'package:flutter/cupertino.dart';
import '../service/remoteok_service.dart';
import '../models/remoteok.dart';

class RemoteokProvider with ChangeNotifier {
  List<RemoteOk> _items = [];
  var isLoading = false;
  List<String> myTags = [];
  List<RemoteOk> get items {
    return [..._items];
  }

  RemoteOk findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetRemoteok() async {
    isLoading = true;
    final response = await RemoteokService().getAllRemote();
    if (response == null) {
      _items = [];
      notifyListeners();
      return;
    }
    _items = response
        .map((item) => RemoteOk(
              //Map i biz oluşturduk classtaki mape gerek kalmadı
              id: item["id"].toString(),
              slug: item["slug"].toString(),
              date: item["date"],
              epoch: item["epoch"].toString(),
              company: item["company"].toString(),
              companyLogo: item["company_logo"],
              position: item["position"],
              tags: item["tags"],
              logo: item["logo"],
              description: item["description"].toString(),
              location: item["location"],
              original: item["original"],
              applyUrl: item["apply_url"],
            ))
        .toList();
    isLoading = false;
    notifyListeners();
  }
  

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
