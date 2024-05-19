class TasksModel {
  String? status;
  List<Task>? message;

  TasksModel({this.status, this.message});

  TasksModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <Task>[];
      json['message'].forEach((v) {
        message!.add(new Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Task {
  String? taskId;
  String? title;
  String? sectionId;
  String? fromTime;
  String? toTime;
  String? day;
  String? taskDescription;
  String? finishOnTimePerc;
  String? pastDeadline;
  String? stillAngling;

  Task(
      {this.taskId,
        this.title,
        this.sectionId,
        this.fromTime,
        this.toTime,
        this.day,
        this.taskDescription,
        this.finishOnTimePerc,
        this.pastDeadline,
        this.stillAngling});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    title = json['title'];
    sectionId = json['section_id'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    day = json['day'];
    taskDescription = json['task_description'];
    finishOnTimePerc = json['finish_on_time_perc'];
    pastDeadline = json['past_deadline'];
    stillAngling = json['still_angling'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['title'] = this.title;
    data['section_id'] = this.sectionId;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['day'] = this.day;
    data['task_description'] = this.taskDescription;
    data['finish_on_time_perc'] = this.finishOnTimePerc;
    data['past_deadline'] = this.pastDeadline;
    data['still_angling'] = this.stillAngling;
    return data;
  }
}
