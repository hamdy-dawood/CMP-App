import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/features/covenants/covenants_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RememberMeWidget extends StatefulWidget {
  final bool isCheck;
  final String covenantId;
  const RememberMeWidget({super.key, required this.isCheck, required this.covenantId});

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<CovenantsCubit>(context).selectedCovenant == widget.covenantId ? Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),) : InkWell(
      onTap: (){
        BlocProvider.of<CovenantsCubit>(context).selectedCovenant = widget.covenantId;
         BlocProvider.of<CovenantsCubit>(context).checkUncheck(covenantId: widget.covenantId);
      },
      child: Container(alignment: Alignment.center,
          width : 20.w, height : 20.h,
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.mainColor, width: 1.5),
              borderRadius: BorderRadius.circular(6)),
          child: widget.isCheck ? Icon(CupertinoIcons.checkmark_alt,size: 15,
              color: ColorManager.mainColor) : null),
    );
  }
}
