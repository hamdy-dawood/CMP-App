class TaskDetailsModel {
  String? status;
  List<Message>? message;

  TaskDetailsModel({this.status, this.message});

  TaskDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
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

class Message {
  String? subTaskId;
  String? taskId;
  String? name;
  String? time;

  Message({this.subTaskId, this.taskId, this.name, this.time});

  Message.fromJson(Map<String, dynamic> json) {
    subTaskId = json['sub_task_id'];
    taskId = json['task_id'];
    name = json['name'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_task_id'] = this.subTaskId;
    data['task_id'] = this.taskId;
    data['name'] = this.name;
    data['time'] = this.time;
    return data;
  }
}
