import 'package:cmp_app/core/functions/app_functions.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/error_widget.dart';
import 'package:cmp_app/features/covenants/covenants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/covenants_item.dart';

class CovenantsView extends StatefulWidget {
  const CovenantsView({super.key});

  @override
  State<CovenantsView> createState() => _CovenantsViewState();
}

class _CovenantsViewState extends State<CovenantsView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CovenantsCubit>(context).getCovenants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.h),
        child: Stack(
          children: [
            Container(
              height: 180.h,
              padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24.r),
                ),
                color: ColorManager.mainColor,
              ),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: CustomText(
                  text: "Covenants",
                  color: ColorManager.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    MagicRouter.navigatePop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.white,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<CovenantsCubit, CovenantsState>(
        listener: (context, state) {
          if(state is CheckUnCheckConvenantsErrorState){
            AppFunctions.showsToast(state.message, ColorManager.red, context);
          }
        },
        builder: (context, state) {
          if(state is CovenantsLoadingState) {
            return Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),);
          }
          if(state is CovenantsErrorState){
            return DefaultErrorWidget(onTap: () => BlocProvider.of<CovenantsCubit>(context).getCovenants(), errorMessage: state.message);
          }else{
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                BlocProvider.of<CovenantsCubit>(context).covenantsModel?.message?.length??0,
                    (index) => CovenantsItem(
                  image: BlocProvider.of<CovenantsCubit>(context).covenantsModel?.message?[index].image??'',
                  title: BlocProvider.of<CovenantsCubit>(context).covenantsModel?.message?[index].title??'',
                  subTitle: BlocProvider.of<CovenantsCubit>(context).covenantsModel?.message?[index].discription??'',
                  address: BlocProvider.of<CovenantsCubit>(context).covenantsModel?.message?[index].location??'',
                  isCheck: BlocProvider.of<CovenantsCubit>(context).covenantsModel?.message?[index].delivered == '1' ? true : false,
                  covenantId: BlocProvider.of<CovenantsCubit>(context).covenantsModel?.message?[index].covenantId??'',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
