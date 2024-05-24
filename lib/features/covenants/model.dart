class CovenantsModel {
  String? status;
  List<Message>? message;

  CovenantsModel({this.status, this.message});

  CovenantsModel.fromJson(Map<String, dynamic> json) {
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
  String? covenantId;
  String? userId;
  String? image;
  String? title;
  String? deliveryDate;
  String? delivered;
  String? discription;
  String? location;

  Message(
      {this.covenantId,
        this.userId,
        this.image,
        this.title,
        this.deliveryDate,
        this.delivered,
        this.discription,
        this.location});

  Message.fromJson(Map<String, dynamic> json) {
    covenantId = json['covenant_id'];
    userId = json['user_id'];
    image = json['image'];
    title = json['title'];
    deliveryDate = json['delivery_date'];
    delivered = json['delivered'];
    discription = json['discription'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['covenant_id'] = this.covenantId;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['delivery_date'] = this.deliveryDate;
    data['delivered'] = this.delivered;
    data['discription'] = this.discription;
    data['location'] = this.location;
    return data;
  }
}
