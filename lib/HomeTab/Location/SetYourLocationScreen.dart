import 'package:cheffy/HomeTab/Location/SetCurrentLocationScreenMapView.dart';
import 'package:cheffy/Utils/images,dart.dart';
import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/Utils/theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetYourLocationScreen extends StatefulWidget {
  const SetYourLocationScreen({Key? key}) : super(key: key);

  @override
  _SetYourLocationScreenState createState() => _SetYourLocationScreenState();
}

class _SetYourLocationScreenState extends State<SetYourLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Set Your location',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    // fillColor: Colors.grey.shade100,
                    fillColor: AppColors.soap,
                    filled: true,
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.soap,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.soap,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    hintText: 'Find Location',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    AppImages.ic_current_location,
                    width: 24,
                    height: 24,
                  ),
                  title: Text(
                    'Set Current location',
                    style: AppStyle.of(context).b4M.wCPlumpPurplePrimary,
                  ),
                  subtitle: Text(
                    'Using GPS',
                    style: AppStyle.of(context).b5.wCCrayola,
                  ),
                  // onTap: viewModel.onTapSetCurrentLocation,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                SetCurrentLocationScreenMapView()));
                  },
                ),
                Divider(
                  thickness: 3,
                  color: AppColors.soap,
                ),
                const SizedBox(height: 12),
                Text(
                  'Recently Search',
                  style: AppStyle.of(context).b5.wCRhythm,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        visualDensity: VisualDensity.compact,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Miami - Florida',
                          style: AppStyle.of(context).b4M.wCChineseBlack,
                        ),
                        subtitle: Text(
                          '4425 SW 8th St, Coral Gables, FL 33134',
                          style: AppStyle.of(context).b5.wCRhythm,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ListTile(
                        visualDensity: VisualDensity.compact,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Los Angeles - California',
                          style: AppStyle.of(context).b4M.wCChineseBlack,
                        ),
                        subtitle: Text(
                          '1160 Santee St, Los Angeles, CA 90015, United States',
                          style: AppStyle.of(context).b5.wCRhythm,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
