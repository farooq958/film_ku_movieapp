import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CustomSizedBoxExt on num {
  SizedBox get x => SizedBox(width: toDouble());

  SizedBox get y => SizedBox(height: toDouble());
}
extension DateExt on DateTime {
  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9,May 2023

  String get toPkDate {
    int day = this.day;
    var monthNames = [
      " ",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return "${day} ${monthNames[this.month]}, ${this.year}";
  }

  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9:12:23 PM
  String get toPkTime {
    int hour = this.hour;
    int minute = this.minute;
    int sec = this.second;

    String formattedTime = DateFormat('h:mm a').format(this);

    return formattedTime;
  }

  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9:12 PM
  String get toHourAndMinutes {
    int hour = this.hour;
    int minute = this.minute;

    String formattedTime =
    DateFormat('h:mm a').format(DateTime(2022, 1, 1, hour, minute));

    List<String> parts = formattedTime.split(' ');
    String timePart = parts[0]; // Contains the time part (hour:minute)
    String ampmPart = parts[1]; // Contains the AM/PM part

    // Split the time part into hour and minute
    List<String> timeParts = timePart.split(':');
    int formattedHour = int.parse(timeParts[0]);
    int formattedMinute = int.parse(timeParts[1]);

    // Apply formatting logic
    String finalHour =
    formattedHour < 10 ? '0$formattedHour' : '$formattedHour';
    String finalMinute =
    formattedMinute < 10 ? '0$formattedMinute' : '$formattedMinute';

    return "$finalHour:$finalMinute $ampmPart";
  }



  String get humanReadableDate {
    //print("object");
    return DateFormat('yyyy-MM-dd').format(this);
  }
  String get humanReadableTime {
    final hours = hour.toString().padLeft(2, '0');
    final minutes = minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  String get weekName {
    return DateFormat('EEEE').format(this);
  }

  DateTime get nowTypeFormatData {
    DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    String formattedDate = outputFormat.format(this);

    return DateTime.parse(formattedDate);
  }
}