import 'package:himalsanchar/helpers/get_time_ago_modified.dart';

class TimeAgo {
  final dynamic time;
  TimeAgo(this.time);
  get() {
    var convertedTimestamp = DateTime.parse(time);
    dynamic dateTime = GetTimeAgoModified.parse(
      convertedTimestamp,
      pattern: 'dd mm yy',
    );
    return dateTime;
  }
}
