import 'dart:math' show cos, sqrt, asin;

class Service {
  int id;
  String photo;
  String providerName;
  String category;
  String serviceTitle;
  String description;
  double score;
  double latitude;
  double longitude;
  String region;
  double distance;
  double _refLatitude;
  double _refLongitude;

  Service();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'photo': photo,
      'providerName': providerName,
      'category': category,
      'serviceTitle': serviceTitle,
      'description': description,
      'score': score,
      'latitude': latitude,
      'longitude': longitude,
      'region': region,
      'distance': distance,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Service.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photo = map['photo'];
    providerName = map['providerName'];
    category = map['category'];
    serviceTitle = map['serviceTitle'];
    description = map['description'];
    score = map['score'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    region = map['region'];
  }

  setReference(double reflatitude, double reflongitude) {
    _refLatitude = reflatitude;
    _refLongitude = reflongitude;
    double d =
        calculateDistance(latitude, longitude, _refLatitude, _refLongitude);
    distance = double.parse(d.toStringAsFixed(2));
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    // https://stackoverflow.com/questions/54138750/total-distance-calculation-from-latlng-list
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  String toString() {
    // TODO: implement toString
    String serviceString =
        '{ $id, $photo, $providerName, $category, $serviceTitle, $description, $score, $latitude, $longitude, $region, $distance, $_refLatitude, $_refLongitude}';
    return serviceString;
  }
}
