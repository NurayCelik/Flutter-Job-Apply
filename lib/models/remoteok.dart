import 'package:flutter/foundation.dart';


class RemoteOk {
  final String id;
  final String slug;
  final String epoch;
  final String date;
  final String company;
  final String companyLogo;//company_logo
  final String position;
  final List tags; //List<String> tags;
  final String logo;
  final String description;
  final String location;
  final bool original;
  final String applyUrl;//apply_url
  
  
  RemoteOk({
    @required this.id,
    @required this.slug,
    @required this.epoch,
    @required this.date,
    @required this.company,
    @required this.companyLogo,
    @required this.position,
    @required this.tags,
    @required this.logo,
    @required this.description,
    @required this.location,
    @required this.original,
    @required this.applyUrl,
    });

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}