String getTimestampString(DateTime date) {
  DateTime curDate = new DateTime.now();
  Duration diff = curDate.difference(date);
  if (diff.inDays > 0) {
    return diff.inDays.toString() + "天前";
  } else if (diff.inHours > 0) {
    return diff.inHours.toString() + "小时前";
  } else if (diff.inMinutes > 0) {
    return diff.inMinutes.toString() + "分钟前";
  } else if (diff.inSeconds > 0) {
    return "刚刚";
  }
  return date.toString();
}

String formatDateStr(String date) {
  DateTime moonLanding = DateTime.parse(date);
  return '${moonLanding.year}-${moonLanding.month}-${moonLanding.day}';
}

//String getWeekDay(String date) {
//  DateTime dateTime = DateTime.parse(date);
//  var weekDay = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];
//  return '${weekDay[dateTime.weekday - 1]}';
//}

String getWeekDay(int i) {
  var weekDay = ["日", "一", "二", "三", "四", "五", "六"];
  return '${weekDay[i]}';
}

String getDay(date) {
  DateTime dateTime = DateTime.parse(date);
  String day = dateTime.day.toString();
  return day.length < 2 ? '0$day' : day;
}

String getMonth(date) {
  DateTime dateTime = DateTime.parse(date);
  var months = [
    "一月",
    "二月",
    "三月",
    "四月",
    "五月",
    "六月",
    "七月",
    "八月",
    "九月",
    "十月",
    "十一月",
    "十二月"
  ];
  return '${months[dateTime.month - 1]}';
}