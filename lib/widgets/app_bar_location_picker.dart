import 'package:cheffy/HomeTab/Location/SetYourLocationScreen.dart';
import 'package:cheffy/Utils/images,dart.dart';
import 'package:cheffy/Utils/theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarLocationPicker extends StatefulWidget {
  @override
  State<AppBarLocationPicker> createState() => _AppBarLocationPickerState();
}

class _AppBarLocationPickerState extends State<AppBarLocationPicker> {
  // final VoidCallback? onTapChangeLocation;
  @override
  Widget build(BuildContext context) {
    onTapChangeLocation() {
      Navigator.push(context, CupertinoPageRoute(builder: (context) {
        return SetYourLocationScreen();
      }));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20,
          backgroundImage: AssetImage(AppImages.img_avatar_2),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: onTapChangeLocation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: AppStyle.of(context).b5.wCRhythm,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Miami, Florida',
                    style: AppStyle.of(context).b4M,
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(AppImages.ic_arrow_down,
                      width: 10.5, height: 5.25)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
