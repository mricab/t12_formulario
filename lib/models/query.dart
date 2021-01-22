import 'package:formulario/db/db_helper.dart';
import 'package:formulario/models/service.dart';

class Query {
  String category;
  double score;
  double proximity;
  String region;
  double _refLatitude;
  double _refLongitude;
  Query({this.category, this.score, this.proximity, this.region});

  Future<List<Service>> getAll() async {
    var rawData = await DbHelper.instance.queryAll();
    return convert(rawData);
  }

  Future<List<Service>> getQuery() async {
    var columns = ['*'];
    String wheres = 'category = ? AND region = ? AND score >= ?';
    var args = [category, region, score];
    var rawData = await DbHelper.instance.query(columns, wheres, args);
    var preparedData = convert(rawData);
    var filteredByDistanceData = filterByDistance(preparedData);
    printQuery(filteredByDistanceData);
    return filteredByDistanceData;
  }

  List<Service> convert(List<Map<String, dynamic>> rawList) {
    List<Service> newList = new List();
    for (var map in rawList) {
      Service service = new Service();
      service = Service.fromMap(map);
      service.setReference(_refLatitude, _refLongitude);
      newList.add(service);
    }
    return newList;
  }

  List<Service> filterByDistance(List<Service> list) {
    List<Service> newList = new List();
    for (var service in list) {
      if (service.distance <= proximity) {
        newList.add(service);
      }
    }
    return newList;
  }

  void setReferencePoint(double refLatitude, double refLongitude) {
    _refLatitude = refLatitude;
    _refLongitude = refLongitude;
  }

  void printQuery(list) {
    for (var service in list) {
      print(service.toString());
    }
  }

  bool isSet() {
    return (category != null &&
        score != null &&
        proximity != null &&
        region != null);
  }
}
