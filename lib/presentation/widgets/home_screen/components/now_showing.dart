import 'package:film_ku/application/services/NavigatorService/navigator_service.dart';
import 'package:film_ku/application/utils/Extensions/extensions.dart';
import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/resources/api_routes.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/domain/movie_model.dart';
import 'package:film_ku/gen/assets.gen.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:film_ku/presentation/common/quick_image.dart';
import 'package:film_ku/presentation/widgets/home_screen/controller/now_showing_cubit.dart';
import 'package:film_ku/presentation/widgets/home_screen/movie_detail/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowShowing extends StatefulWidget {
  const NowShowing({super.key});

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {

  @override
  void initState() {
    context.read<NowShowingCubit>().getNowShowing(pageNo: 1);
    nowShowingController.addListener((){

      if(nowShowingController.position.pixels >= nowShowingController.position.maxScrollExtent-200)
        {
          print("inCondition");
          context.read<NowShowingCubit>().getNowShowing(isLoad: true);
        }


    });
    // TODO: implement initState
    super.initState();
  }
  ScrollController nowShowingController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData =Theme.of(context);
    return BlocConsumer<NowShowingCubit, NowShowingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is NowShowingLoaded) {

          return SizedBox(
            width: 1.sw,
            height: 0.35.sh,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              controller: nowShowingController,

              //shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){

                    _onNowCardTap( state.nowShowingModel[index],index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shadowColor: Colors.black.withOpacity(0.5),
                        elevation: 3,
                        child: SizedBox(
                          width: 145.w,
                          height: 212.h,

                            child: QuickImage(url: ApiRoutes.imageBaseUrl+state.nowShowingModel[index].posterPath!,fit: BoxFit.cover,
                      radius: BorderRadius.circular(10),

                            ),
                        ),
                      ),
                      5.y,
                      AppText(
                        state.nowShowingModel[index].title!,
                        style: AppTextStyles.mulishBold(),
                        maxLine: 2,

                        overflow: TextOverflow.ellipsis,
                      ),
                      5.y,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,


                        children: [

                          QuickImage(url: Assets.icons.starIcon,fit: BoxFit.scaleDown,),
                          5.x,
                          AppText(
                            state.nowShowingModel[index].voteAverage.toString(),
                            style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),
                            maxLine: 1,

                            overflow: TextOverflow.ellipsis,
                          ),
                          AppText('/',
                            style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),
                            maxLine: 1,

                            overflow: TextOverflow.ellipsis,),
                          AppText(
                            '10 IMDB',
                            style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),
                            maxLine: 1,

                            overflow: TextOverflow.ellipsis,
                          ),


                        ],

                      )




                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 10.x;
              },
              itemCount: state.nowShowingModel.length),
          );

        }
        else{
          return const SizedBox.shrink();
        }
      },
    );

  }
  void _onNowCardTap(MovieModel popularDto,int firstIndex) {

    Navigate.instance.to(MovieDetail(movieId:popularDto.id, firstIndex: firstIndex,));

  }
}
