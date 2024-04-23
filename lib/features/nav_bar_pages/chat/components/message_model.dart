import 'constants.dart';

class Message {
  final String id;
  final String message;
  final dynamic time;

  Message(
    this.id,
    this.message,
    this.time,
  );

  factory Message.fromJson(jsonData) {
    return Message(
      jsonData['id'],
      jsonData[kMessage],
      jsonData['createdAt'],
    );
  }
}
