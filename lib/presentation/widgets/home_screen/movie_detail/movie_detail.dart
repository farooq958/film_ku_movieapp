import 'package:film_ku/application/services/NavigatorService/navigator_service.dart';
import 'package:film_ku/application/utils/Extensions/extensions.dart';
import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/resources/api_routes.dart';
import 'package:film_ku/data/resources/app_providers.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/domain/genre_model.dart';
import 'package:film_ku/domain/movie_detail_model.dart';
import 'package:film_ku/gen/assets.gen.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:film_ku/presentation/common/quick_image.dart';
import 'package:film_ku/presentation/common/video_widget.dart';
import 'package:film_ku/presentation/widgets/home_screen/components/genre_chips.dart';
import 'package:film_ku/presentation/widgets/home_screen/components/home_row_widget.dart';
import 'package:film_ku/presentation/widgets/home_screen/controller/genre_controller.dart';
import 'package:film_ku/presentation/widgets/home_screen/movie_detail/controller/movie_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key,  this.movieId,required this.firstIndex});
final int? movieId;
final int firstIndex;
  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    
    context.read<MovieDetailCubit>().getMovieById(widget.movieId!);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ThemeData themeData =Theme.of(context);
    return  Scaffold(
      backgroundColor: Colors.white,
body: ValueListenableBuilder(
  builder: (context,val,child) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieDetailLoaded) {
          print(state.movieDetailModel.genres![0].name);
          List<GenreModel> genreList=state.movieDetailModel.genres!;
          
         // List<GenreModel> genreListId=GenreController.genreDto.value.where((element) => genrs.where((e)=>e.id==element.id).contains(element.id)).toList();
          return Stack(
            children: [

              Stack(
                children: [
                  QuickImage(url: ApiRoutes.imageBaseUrl+state.movieDetailModel.posterPath!),
             widget.firstIndex==0? Positioned(
                  top: 1.stB+100,
                  right: 0,
                  left: 0,

                  child: InkWell(
                      onTap: (){
                        
                        Navigate.instance.to(const AppVideoScreen(videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));
                        
                      },
                      child: Icon(Icons.play_circle,color: Colors.white,size: 60.w,))):const SizedBox.shrink()

                ],
              )

              ,
              Positioned(
                  top: 1.stB+10,
                  child:  SizedBox(
                    width: 1.sw,
                    child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        10.x,
                              const  BackButton(color: Colors.white,


                                ),
                const    Spacer(),
                      QuickImage(url: Assets.icons.threeDotsIcon),
                        20.x,



                              ],),
                  )),
              Align(
                alignment: Alignment.bottomCenter,


                  child: Container(height: 0.65.sh,

                    decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),

                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Align(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              20.y,
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: AppText(state.movieDetailModel.title!,
                                      maxLine: 2,
                                      style: AppTextStyles.mulishBold(fontSize: 20.fS,fontWeight: FontWeight.bold),),
                                  ),
                                //  const Spacer(),
                                  QuickImage(url: Assets.icons.bookmarkIcon3,color: Colors.black,)
                          
                          
                          
                          
                                ],
                              ),
                              10.y,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                          
                          
                                children: [
                          
                                  QuickImage(url: Assets.icons.starIcon,fit: BoxFit.scaleDown,),
                                  5.x,
                                  AppText(
                                    state.movieDetailModel.voteAverage.toString(),
                                    style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),
                                    maxLine: 1,
                          
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  AppText(' / ',
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
                              10.y,
                          
                              GenreChips(genreListId: genreList),
                              15.y,
                          
                              Row(
                          
                                children: [
                          
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                          
                                    AppText('Length',style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),),
                                    AppText('2 hr 28 min',style: AppTextStyles.mulishRegular(),),
                          
                          
                                  ],),
                                  20.x,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                          
                                      AppText('Language',style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),),
                                      AppText(state.movieDetailModel.spokenLanguages![0].name!,style: AppTextStyles.mulishRegular(),),
                          
                          
                                    ],),
                                  20.x,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                          
                                      AppText('Rating',style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),),
                                      AppText('PG-13',style: AppTextStyles.mulishRegular(),),
                          
                          
                                    ],)
                          
                          
                          
                              ],),
                              
                              15.y,
                              AppText('Description',style: AppTextStyles.merriBold(fontSize: 18.fS),)
                          ,
                                  10.y,
                              AppText(state.movieDetailModel.overview??"",style: AppTextStyles.merriRegular(color: themeData.colorScheme.outlineVariant,fontSize: 12),maxLine: 10,)
                          ,
                              15.y,
                              HomeRowWidget(themeData: themeData,title: 'Cast',),
                              20.y,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: state.movieDetailModel.productionCompanies!.map((element){
                          
                                  return Container(
                                    margin: EdgeInsets.only(left: 20.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      element.logoPath==null?const Icon(Icons.error_outline,size: 50,) :  QuickImage(url: ApiRoutes.imageBaseUrl+element.logoPath!,height: 50.h,width: 50.w,),
                                    5.y,
                                        SizedBox(
                                          width: 88.w,
                                          child: AppText(element.name!,
                                            maxLine: 2,
                                            style: AppTextStyles.mulishRegular(color: themeData.colorScheme.outlineVariant),),
                                        )
                                      ],
                                    ),
                                  );
                          
                                }).toList(),),
                              )
                          
                            ],
                          
                          ),
                        ),
                      ),
                    ),

                  ))

            ],
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }, valueListenable: GenreController.genreLoading,
),

    );
  }
}
