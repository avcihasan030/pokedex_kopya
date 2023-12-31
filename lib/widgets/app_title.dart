import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/constants/constants.dart';
import 'package:poke_dex/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return SafeArea(
      child: SizedBox(
        height: UIHelper.getAppTitleWidgetHeight(),
        child: Stack(
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTitleStyle(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                pokeballImageUrl,
                width: ScreenUtil().orientation == Orientation.portrait
                    ? 0.2.sh
                    : 0.2.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
