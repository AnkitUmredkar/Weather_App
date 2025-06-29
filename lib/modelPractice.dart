class ModelPractice {
  late Location location;
  late Current current;
  late Forecast forecast;

  ModelPractice(
      {required this.location, required this.current, required this.forecast});

  factory ModelPractice.fromJson(Map m1) {
    return ModelPractice(
        location: Location.fromJson(m1['location']),
        current: Current.fromJson(m1['current']),
        forecast: m1["forecast"]);
  }
}

class Location {
  late String name, region, country;

  Location({required this.name, required this.region, required this.country});

  factory Location.fromJson(Map m1) {
    return Location(
        name: m1['name'], region: m1['region'], country: m1['country']);
  }
}

class Current {
  late double temp_c, temp_f;

  Current({required this.temp_c, required this.temp_f});

  factory Current.fromJson(Map m1) {
    return Current(
        temp_c: m1['temp_c'].toDouble(), temp_f: m1['temp_f'].toDouble());
  }
}

class Forecast {}
