import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String sendEmail;
  final String receiverId;
  final String message;
  final Timestamp timeStamp;

  Message({
    required this.senderId,
    required this.sendEmail,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "sendEmail": sendEmail,
      "receiverId": receiverId,
      "message": message,
      "timeStamp": timeStamp,
    };
  }
}
