class TaskModel {
  static const String collectionName='Tasks';

  String? id;
  String? title;
  String? description;
  int? date;
  bool? isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.date,
      required this.description,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          date: json['date'],
          description: json['description'],
          isDone: json['isDone'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "date": date,
      "isDone": isDone,
    };
  }
}
