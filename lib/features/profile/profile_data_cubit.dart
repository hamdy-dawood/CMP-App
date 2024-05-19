import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/profile/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit() : super(ProfileDataInitial());

  Future<void> getProfileData() async {
    emit(ProfileDataLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/profile_data.php",
          data: {
            "user_id": CacheHelper.getId(),
          });

      ProfileDataModel profileDataModel = ProfileDataModel.fromJson(response.data);

      if (profileDataModel.status == 'success') {
        emit(ProfileDataSuccessState(profileDataModel));
      } else {
        emit(const ProfileDataErrorState("Something went wrong, please try again"));
      }
    }catch (e){
      emit(const ProfileDataErrorState("Something went wrong, please try again"));
    }
  }
}
