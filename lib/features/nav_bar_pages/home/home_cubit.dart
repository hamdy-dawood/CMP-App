import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/nav_bar_pages/home/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getHome() async {
    emit(HomeLoadingState());
    // try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/home_page.php",
          data: {
            "user_id": CacheHelper.getId(),
          });

      HomeModel homeModel = HomeModel.fromJson(response.data);

      if (homeModel.status == 'success') {
        emit(HomeSuccessState(homeModel));
      } else {
        emit(const HomeErrorState("Something went wrong, please try again"));
      }
    // }catch (e){
    //   emit(const HomeErrorState("Something went wrong, please try again"));
    // }
  }
}
