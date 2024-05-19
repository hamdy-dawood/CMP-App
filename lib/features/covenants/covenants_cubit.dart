import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/covenants/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'covenants_state.dart';

class CovenantsCubit extends Cubit<CovenantsState> {
  CovenantsCubit() : super(CovenantsInitial());

  Future<void> getCovenants() async {
    emit(CovenantsLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/select_covenant.php",
          data: {
            "user_id": CacheHelper.getId(),
          });

      CovenantsModel covenantsModel = CovenantsModel.fromJson(response.data);

      if (covenantsModel.status == 'success') {
        emit(CovenantsSuccessState(covenantsModel));
      } else {
        emit(const CovenantsErrorState("Something went wrong, please try again"));
      }
    }catch (e){
      emit(const CovenantsErrorState("Something went wrong, please try again"));
    }
  }
}
