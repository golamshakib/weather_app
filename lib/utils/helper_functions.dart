
import 'package:intl/intl.dart';
import 'package:weather_app/utils/constants.dart';

String iconFullUrl(String icon) => '$iconPrefix$icon$iconSuffix' ;

String getFormatedDateTime(num dt, {String pattern = 'dd/MM/yyyy'}){
  return DateFormat(pattern).format(
      DateTime.fromMillisecondsSinceEpoch(dt.toInt() * 1000));

}

String capitalizeWords(String str) {
  return str.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}


