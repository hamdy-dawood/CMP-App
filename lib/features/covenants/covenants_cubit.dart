import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/base_model/base_model.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/covenants/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'covenants_state.dart';

class CovenantsCubit extends Cubit<CovenantsState> {
  CovenantsCubit() : super(CovenantsInitial());

  CovenantsModel? covenantsModel;

  Future<void> getCovenants() async {
    if(covenantsModel == null) {
      emit(CovenantsLoadingState());
    }
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/select_covenant.php",
          data: {
            "user_id": CacheHelper.getId(),
          });

      covenantsModel = CovenantsModel.fromJson(response.data);

      if (covenantsModel?.status == 'success') {
        emit(CovenantsSuccessState(covenantsModel!));
      } else {
        emit(const CovenantsErrorState("Something went wrong, please try again"));
      }
    }catch (e){
      emit(const CovenantsErrorState("Something went wrong, please try again"));
    }
  }

  String selectedCovenant = '';

  Future<void> checkUncheck({
    required String covenantId,
  }) async {
    emit(CheckUnCheckConvenantsLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/update_covenant_status.php",
          data: {
            "user_id":CacheHelper.getId(),
            "covenant_id":covenantId
          });

      BaseModel baseModel = BaseModel.fromJson(response.data);

      if (baseModel.status == 'success') {
        await getCovenants();
        selectedCovenant = '';
        emit(CheckUnCheckConvenantsSuccessState(baseModel));
      } else {
        selectedCovenant = '';
        emit(CheckUnCheckConvenantsErrorState(baseModel.message??''));
      }
    }catch (e){
      selectedCovenant = '';
      emit(const CheckUnCheckConvenantsErrorState("Something went wrong, please try again"));
    }
  }

}
