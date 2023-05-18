import 'dart:typed_data';

class Task {
  int? id;
  String? title;
  int? podhod;
  int? povtor;
  int? masStaryad;
  int? dayWeek;
  String? exerciseStatus;
  Uint8List? photo;

  Task({
    this.id,
    this.title,
    this.podhod,
    this.povtor,
    this.masStaryad,
    this.dayWeek,
    this.exerciseStatus,
    this.photo,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    podhod = json['podhod'];
    povtor = json['povtor'];
    masStaryad = json['masStaryad'];
    dayWeek = json['dayWeek'];
    exerciseStatus = json['exerciseStatus'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['podhod'] = podhod;
    data['povtor'] = povtor;
    data['masStaryad'] = masStaryad;
    data['dayWeek'] = dayWeek;
    data['exerciseStatus'] = exerciseStatus;
    data['photo'] = photo;
    return data;
  }
}
