import 'package:film_ku/application/services/NavigatorService/navigator_service.dart';
import 'package:film_ku/application/utils/Extensions/extensions.dart';
import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/resources/api_routes.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/domain/genre_model.dart';
import 'package:film_ku/domain/movie_model.dart';
import 'package:film_ku/gen/assets.gen.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:film_ku/presentation/common/quick_image.dart';
import 'package:film_ku/presentation/widgets/home_screen/components/genre_chips.dart';
import 'package:film_ku/presentation/widgets/home_screen/controller/genre_controller.dart';
import 'package:film_ku/presentation/widgets/home_screen/controller/poupular_cubit.dart';
import 'package:film_ku/presentation/widgets/home_screen/movie_detail/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

ScrollController popularController = ScrollController();

class _PopularWidgetState extends State<PopularWidget> {

  @override
  void initState() {
    GenreController().getGenres();
    context.read<PopularCubit>().getPopular(pageNo: 1);
    popularController.addListener(() {
      if (popularController.position.pixels >=
          popularController.position.maxScrollExtent - 200) {
        print("inCondition");
        context.read<PopularCubit>().getPopular(isLoad: true);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData =Theme.of(context);
    return ValueListenableBuilder(
      builder: (context,val,child) {
     if(val ==2) {
       List<GenreModel> genreList=GenreController.genreDto.value;
       return    BlocConsumer<PopularCubit, PopularState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
           if(state is PopularLoaded) {
             return ListView.separated(
               physics: const BouncingScrollPhysics(),
        
                controller: popularController,
                itemBuilder: (context, index) {
                  MovieModel popularDto=state.popularDto[index];
                  List<GenreModel> genreListId=genreList.where((element) => popularDto.genreIds!.contains(element.id)).toList();
                  return InkWell(
                    onTap: (){

                      _popularTap(popularDto,index);
                    },
                    child: SizedBox(
                      width: 320.w,
                      height: 130.h
                      ,
                      child: Row(children: [

                        QuickImage(url: ApiRoutes.imageBaseUrl+ popularDto.posterPath!,fit: BoxFit.cover,
                          radius: BorderRadius.circular(10),

                        ),
                        10.x,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(popularDto.title??"",style: AppTextStyles.mulishBold(),maxLine: 3,),
                              5.y,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,


                                children: [

                                  QuickImage(url: Assets.icons.starIcon,fit: BoxFit.scaleDown,),
                                  5.x,
                                  AppText(
                                    popularDto.voteAverage.toString(),
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

                              ),
                              //AppText(popularDto.releaseDate!,style: themeData.textTheme.bodyText1,),
                              5.y,
                              GenreChips(genreListId: genreListId),
                              10.y,
                              Row(
                                children: [
                                  const QuickImage(url: 'asset/icons/clockIcon.svg',fit: BoxFit.scaleDown,),
                                 5.x,
                                  AppText(popularDto.releaseDate!.humanReadableDate,style: AppTextStyles.mulishRegular(color: themeData.colorScheme.primary),),
                                ],
                              ),
                              //Text(popularDto.overview!,style: themeData.textTheme.bodyText1,),
                            ],
                          ),
                        )

                      ],),
                      //color: Colors.red,
                    ),
                  );
                }, separatorBuilder: (context, index) {
              return 10.y;
            }, itemCount: state.popularDto.length);
           }
           else
             {
               return const SizedBox.shrink();
             }
          },
        );
     }
     else if(val ==1)
       {
         return const Center(child: CircularProgressIndicator(),);
       }
     else
       {
         return const SizedBox.shrink();
       }
      }, valueListenable: GenreController.genreLoading,
    );
  }

  void _popularTap(MovieModel popularDto,int firstIndex) {

Navigate.instance.to(MovieDetail(movieId:popularDto.id, firstIndex: firstIndex,));

  }
}
