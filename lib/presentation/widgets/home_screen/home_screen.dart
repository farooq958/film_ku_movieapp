import 'package:film_ku/application/utils/Extensions/extensions.dart';
import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:film_ku/presentation/widgets/home_screen/components/home_row_widget.dart';
import 'package:film_ku/presentation/widgets/home_screen/components/now_showing.dart';
import 'package:film_ku/presentation/widgets/home_screen/components/popular_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData =Theme.of(context);
    return NestedScrollView(headerSliverBuilder:(context,val){

      return [

        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 0.43.sh,
          //pinned: ,
          backgroundColor: themeData.colorScheme.onPrimary,
          flexibleSpace: FlexibleSpaceBar(

            background: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.rSA),
              child: Container(
                color: themeData.colorScheme.onPrimary,
                child: Column(children: [
20.y,
                  HomeRowWidget(themeData: themeData,title: 'Now Showing',),
                  10.y,
const NowShowing()



                ],),



              ),
            )
            ,

          ),

        )

      ];

    }, body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.rSA),
      child: Column(children: [
      10.y,
        HomeRowWidget(themeData: themeData,title: 'Popular',),
        10.y,
       const Expanded(child: PopularWidget())





      ],),
    ));
  }
}


