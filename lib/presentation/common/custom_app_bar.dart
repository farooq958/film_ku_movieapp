import 'package:film_ku/application/utils/Extensions/extensions.dart';
import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/gen/assets.gen.dart';
import 'package:film_ku/presentation/common/app_text.dart';
import 'package:film_ku/presentation/common/quick_image.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    required this.themeData,
    required this.scaffoldKey,
  });

  final ThemeData themeData;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: themeData.colorScheme.onPrimary,
      automaticallyImplyLeading: false,

      leading: InkWell(
          onTap: (){

            scaffoldKey.currentState!.openDrawer();

          },
          child: QuickImage(url: Assets.icons.sideMenuIcon,fit: BoxFit.none,)),
      centerTitle: true,
      title: AppText('FilmKu',style: AppTextStyles.merriBold(fontSize: 20.fS),),
      actions: [
        QuickImage(url: Assets.icons.notificationIcon),
        20.x,
      ],

    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1.sw, 63.h);
}