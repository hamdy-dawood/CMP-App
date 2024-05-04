import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmp_app/features/nav_bar_pages/chat/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'state.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ChatCubit() : super(ChatInitialState());

  Future<void> sendMessage({
    required String message,
    required String receiverId,
  }) async {
    try {
      final String currentUserId = _auth.currentUser!.uid;
      final String currentUserEmail = _auth.currentUser!.email!;
      final Timestamp timeStamp = Timestamp.now();

      Message newMessage = Message(
        senderId: currentUserId,
        sendEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timeStamp: timeStamp,
      );

      List<String> ids = [currentUserId, receiverId];
      ids.sort();
      String chatRoomId = ids.join('_');

      await _fireStore
          .collection("chat_rooms")
          .doc(chatRoomId)
          .collection("messages")
          .add(newMessage.toMap());
    } on Exception catch (e) {
      print(e);
      emit(ChatFailureState());
    }
  }

  Stream<QuerySnapshot> getMessages({
    required String userId,
    required String otherUserId,
  }) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timeStamp", descending: false)
        .snapshots();
  }

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _fireStore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }
}
