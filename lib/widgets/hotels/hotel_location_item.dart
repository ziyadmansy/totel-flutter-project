import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class HotelLocationItem extends StatelessWidget {
  final HotelLocationEntity location;
  final VoidCallback? onPress;
  const HotelLocationItem({
    Key? key,
    required this.location,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListTile(
      onTap: onPress,
      leading: location.imageUrl == null
          ? CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ClipOval(
                child: SharedWidgets.buildImageNetwork(
                  imgUrl: location.imageUrl!,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
      title: Text(
        '${location.cityName ?? ''}, ${location.country ?? ''}',
        style: AppStyle.of(context).b4B.wCChineseBlack,
      ),
      subtitle: Text(
        location.label,
        style: AppStyle.of(context).b5.wCRhythm,
      ),
      isThreeLine: true,
    );
  }
}
