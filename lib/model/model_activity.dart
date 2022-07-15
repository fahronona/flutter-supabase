class ModelActivity {
  String? name;
  String? location;
  String? cost;
  String? date;

  ModelActivity({this.name, this.location, this.cost, this.date});

  ModelActivity.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    location = json["location"];
    cost = json["cost"];
    date = json["date"];
  }
}
