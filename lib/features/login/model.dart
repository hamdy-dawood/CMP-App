// class LoginModel {
//   String? status;
//   Data? data;
//   String? message;
//
//   LoginModel({this.status, this.data, this.message});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class Data {
//   String? userId;
//   String? name;
//   String? email;
//   String? sectionId;
//   String? addedDate;
//   String? imageUrl;
//   String? phone;
//   String? points;
//
//   Data(
//       {this.userId,
//         this.name,
//         this.email,
//         this.sectionId,
//         this.addedDate,
//         this.imageUrl,
//         this.phone,
//         this.points});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     name = json['name'];
//     email = json['email'];
//     sectionId = json['section_id'];
//     addedDate = json['added_date'];
//     imageUrl = json['image_url'];
//     phone = json['phone'];
//     points = json['points'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['section_id'] = this.sectionId;
//     data['added_date'] = this.addedDate;
//     data['image_url'] = this.imageUrl;
//     data['phone'] = this.phone;
//     data['points'] = this.points;
//     return data;
//   }
// }
