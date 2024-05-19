class ProfileDataModel {
  String? status;
  Message? message;

  ProfileDataModel({this.status, this.message});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? sectionId;
  String? addedDate;
  String? imageUrl;
  String? phone;

  Message(
      {this.userId,
        this.name,
        this.email,
        this.password,
        this.sectionId,
        this.addedDate,
        this.imageUrl,
        this.phone});

  Message.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    sectionId = json['section_id'];
    addedDate = json['added_date'];
    imageUrl = json['image_url'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['section_id'] = this.sectionId;
    data['added_date'] = this.addedDate;
    data['image_url'] = this.imageUrl;
    data['phone'] = this.phone;
    return data;
  }
}
