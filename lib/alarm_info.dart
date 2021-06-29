class AlarmInfo {
  int id;
  String title;
  DateTime alarmDateTime;
  bool isPending;
  int gradientColorIndex;

  // Create the constructor for this class
  AlarmInfo(
      {this.id,
      this.title,
      this.alarmDateTime,
      this.isPending,
      this.gradientColorIndex});

  //This factory keyword when implementing a constructor that doesn’t always create a new instance of its class.
  // Another use case for factory constructors is initializing a final variable using logic that can’t be handled in the initializer list.
  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isPending: json["isPending"],
        gradientColorIndex: json["gradientColorIndex"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
    //Returns an ISO-8601 full-precision extended format representation
        "alarmDateTime": alarmDateTime.toIso8601String(),
        "isPending": isPending,
        "gradientColorIndex": gradientColorIndex,
      };
}
