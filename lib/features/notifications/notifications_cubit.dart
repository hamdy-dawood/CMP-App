import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/notifications/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  Future<void> getNotifications() async {
    emit(NotificationsLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/notifications.php",
          data: {
            "user_id": CacheHelper.getId(),
          });

      NotificationsModel notificationsModel = NotificationsModel.fromJson(response.data);

      if (notificationsModel.status == 'success') {
        emit(NotificationsSuccessState(notificationsModel));
      } else {
        emit(const NotificationsErrorState("Something went wrong, please try again"));
      }
    }catch (e){
      emit(const NotificationsErrorState("Something went wrong, please try again"));
    }
  }
}
