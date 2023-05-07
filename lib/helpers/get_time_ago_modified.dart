import 'package:himalsanchar/utility/time_ago_messages.dart';
import 'package:intl/intl.dart';

class GetTimeAgoModified {
  
  static String parse(DateTime dateTime, {String? pattern}) {
    final message = EnglishMessages();
    final pattern0 = pattern ?? "dd MMM, yyyy hh:mm aa";
    final date = DateFormat(pattern0).format(dateTime);
    var elapsed =
        DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;

    var prefix = message.prefixAgo();
    var suffix = message.suffixAgo();

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
      msg = message.secsAgo(seconds.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (seconds < 119) {
      msg = message.minAgo(minutes.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (minutes < 59) {
      msg = message.minsAgo(minutes.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (minutes < 119) {
      msg = message.hourAgo(hours.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (hours < 24) {
      msg = message.hoursAgo(hours.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (hours < 48) {
      msg = message.dayAgo(hours.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (days < 30) {
      msg = message.daysAgo(days.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else {
      msg = date;
      result = date;
    }

    return result;
  }
}
