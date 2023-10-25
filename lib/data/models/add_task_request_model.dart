import 'dart:convert';

class AddTaskRequestModel {
    final Data data;

    AddTaskRequestModel({
        required this.data,
    });

    factory AddTaskRequestModel.fromJson(String str) => AddTaskRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddTaskRequestModel.fromMap(Map<String, dynamic> json) => AddTaskRequestModel(
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class Data {
    final String title;
    final String description;

    Data({
        required this.title,
        required this.description,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
    };
}
