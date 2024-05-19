class NotificationsModel {
  String? status;
  List<Message>? message;

  NotificationsModel({this.status, this.message});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
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
  String? notificationId;
  String? userId;
  String? createdAt;
  String? title;

  Message({this.notificationId, this.userId, this.createdAt, this.title});

  Message.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    return data;
  }
}
