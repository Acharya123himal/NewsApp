import 'package:himalsanchar/utility/time_ago_messages.dart';
import 'package:intl/intl.dart';

class GetTimeAgoModified {
  
  static String parse(DateTime dateTime, {String? pattern}) {
    final _message = EnglishMessages();
    final _pattern = pattern ?? "dd MMM, yyyy hh:mm aa";
    final date = DateFormat(_pattern).format(dateTime);
    var elapsed =
        DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;

    var _prefix = _message.prefixAgo();
    var _suffix = _message.suffixAgo();

    ///
    /// Getting [seconds], [minutes], [hours], [days] from provided [dateTime]
    /// by subtracting it from current [DateTime.now()].
    ///

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;

    String msg;
    String result;
    if (seconds < 59) {
      msg = _message.secsAgo(seconds.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (seconds < 119) {
      msg = _message.minAgo(minutes.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (minutes < 59) {
      msg = _message.minsAgo(minutes.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (minutes < 119) {
      msg = _message.hourAgo(hours.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (hours < 24) {
      msg = _message.hoursAgo(hours.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (hours < 48) {
      msg = _message.dayAgo(hours.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (days < 30) {
      msg = _message.daysAgo(days.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else {
      msg = date;
      result = date;
    }

    return result;
  }
}
