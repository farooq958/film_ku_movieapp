import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/domain/genre_model.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:flutter/material.dart';

class GenreChips extends StatelessWidget {
  const GenreChips({super.key,required this.genreListId});
final List<GenreModel> genreListId;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData =Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: genreListId.map((element){

        return Container(
            height: 20.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            //width: 61.w,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: themeData.colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(child: AppText(element.name!,style: AppTextStyles.mulishRegular(color: themeData.colorScheme.secondary),)));

      }).toList(),),
    );
  }
}
