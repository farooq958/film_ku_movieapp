import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:flutter/material.dart';

class HomeRowWidget extends StatelessWidget {
  const HomeRowWidget({
    super.key,
    required this.themeData, required this.title,
  });

  final ThemeData themeData;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Row(children: [

      AppText(title,style: AppTextStyles.merriBold(fontSize: 18.fS),)

      ,const Spacer(),

      Container(height: 22,width: 61,decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: themeData.colorScheme.outline)

      ),
        child: Center(child: AppText('See More',style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant,fontSize: 10.fS),)),
      )




    ],);
  }
}