import 'package:film_ku/application/utils/Extensions/extensions.dart';
import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/gen/assets.gen.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:film_ku/presentation/common/custom_app_bar.dart';
import 'package:film_ku/presentation/common/quick_image.dart';
import 'package:film_ku/presentation/widgets/home_master_screen/controller/bottom_controller.dart';
import 'package:film_ku/presentation/widgets/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class HomeMasterScreen extends StatefulWidget {
  const HomeMasterScreen({super.key});

  @override
  State<HomeMasterScreen> createState() => _HomeMasterScreenState();
}

class _HomeMasterScreenState extends State<HomeMasterScreen> {
  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    MediaQueryManager().initialize(context);
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
        backgroundColor: themeData.colorScheme.onPrimary,
        drawer: const Drawer(),
        appBar: CustomAppBar(themeData: themeData, scaffoldKey: scaffoldKey),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white54,
          elevation: 5.2.rSA,
          shape: const CircularNotchedRectangle(),
          height: 80,
          child: ValueListenableBuilder(
            builder: (context, state, ss) {
              return Row(
                //children inside bottom appbar
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //5.x,
                  //10.x,
                  ///Home
                  InkWell(
                    onTap: () {
                      if (state != 0) {
                        BottomNotifier.bottomPageController!.jumpToPage(0);
                        BottomNotifier.bottomNavigationNotifier.value = 0;
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        5.y,
                        Expanded(
                          flex: 2,
                          child: Align(
                              child: QuickImage(
                            url: Assets.icons.homeIcon,
                          )),
                        ),
                      ],
                    ),
                  ),
                  10.x,

                  ///bookmark screen 1
                  InkWell(
                    onTap: () {
                      if (state != 1) {
                        BottomNotifier.bottomPageController!.jumpToPage(1);
                        BottomNotifier.bottomNavigationNotifier.value = 1;
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                              child: QuickImage(
                            url: Assets.icons.bookmarkIcon,
                          )),
                        ),
                      ],
                    ),
                  ),
                  // 50.x,
                  10.x,

                  ///bookmark screen 2
                  InkWell(
                    onTap: () {
                      if (state != 2) {
                        BottomNotifier.bottomPageController!.jumpToPage(2);
                        BottomNotifier.bottomNavigationNotifier.value = 2;
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                              child: QuickImage(
                            url: Assets.icons.bookmarkIcon3,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            valueListenable: BottomNotifier.bottomNavigationNotifier,
          ),
        ),
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: PageView(
            controller: BottomNotifier.bottomPageController,
            onPageChanged: (x) {
              BottomNotifier.bottomNavigationNotifier.value = x;
            },
            children: const [
              HomeScreen(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AppText('Bookmark Content 1')],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AppText('Bookmark Content 2')],
              ),
            ],
          ),
        ));
  }
}


