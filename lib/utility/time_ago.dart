import 'package:himalsanchar/helpers/get_time_ago_modified.dart';

class TimeAgo {
  final dynamic time;
  TimeAgo(this.time);
  get() {
    var _convertedTimestamp = DateTime.parse(time);
    dynamic _dateTime = GetTimeAgoModified.parse(
      _convertedTimestamp,
      pattern: 'dd mm yy',
    );
    return _dateTime;
  }
}
