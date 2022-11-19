import 'package:get_time_ago/get_time_ago.dart';

class SharedCore {
  static String getTimeAgoFromDate(DateTime date) {
    return GetTimeAgo.parse(date);
  }
}
