import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
//app files
import 'package:flutter_boilerplate/controllers/common/loading_controller.dart';
import 'package:flutter_boilerplate/global/theme/app_color.dart';
import 'package:flutter_boilerplate/global/networking/server_config.dart';

ServerConfig _serverConfig = ServerConfig();
AppColor appColor = AppColor();

final _storage = GetStorage();
var loadingCtrl = Get.find<LoadingController>();

class Helper {
  dynamic getStorage(String name) {
    dynamic info = _storage.read(name) ?? '';
    return info != '' ? json.decode(info) : info;

    //ex : helper.getStorage('authToken');
  }

  Future<dynamic> writeStorage(String key, dynamic value) async {
    dynamic object = value != null ? json.encode(value) : value;
    return await _storage.write(key, object);

    //ex : await helper.writeStorage(session.id, data['id']);
  }

  dynamic removeSpecificKeyStorage(String key) {
    _storage.remove(key);

    //ex : helper.removeSpecificKeyStorage(session.authToken);
  }

  clearStorage() {
    _storage.erase();

    //ex : helper.clearStorage();
  }

  getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];

    //ex : helper.getRandomColor();
  }

  getDateString(DateTime date, String patten) {
    return DateFormat(patten ?? 'dd-MM-yyyy').format(date);

    //ex : helper.getDateString(DateTime.now(), 'dd-MMM-yyyy');
  }

  toDate(String date) {
    if (date != null) return DateTime.parse(date);

    //ex : helper.toDate('2012-01-26T13:51:50.417-07:00');
  }

  launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : Get.snackbar('error', 'Could not launch $url');

    //ex : helper.launchURL('https://www.google.com');
  }

  successMessage(message) {
    return Get.snackbar('success', message, backgroundColor: Colors.green, colorText: Colors.white);

    //ex : helper.successMessage('success message');
  }

  errorMessage(message) {
    return Get.snackbar('error', message, backgroundColor: Colors.red, colorText: Colors.white);

    //ex : helper.errorMessage('error message');
  }

  alertMessage(message) {
    return Get.snackbar('alert', message, backgroundColor: Colors.yellow, colorText: Colors.black);

    //ex : helper.alertMessage('alert message');
  }

  dialogMessage(String message, {VoidCallback onConfirm}) {
    return Get.defaultDialog(
      middleText: "$message",
      onConfirm: onConfirm,
      confirmTextColor: appColor.textPrimaryColor,
    );

    //ex : helper.dialogMessage('dialog message', (){});
  }

  void showLoading() {
    return loadingCtrl.showLoading();

    //ex : helper.showLoading();
  }

  void hideLoading() {
    return loadingCtrl.hideLoading();

    //ex : helper.hideLoading();
  }

  String getImagePath(String url) {
    if (url != null) {
      if (url.contains('http') || url.contains('https'))
        return url;
      else {
        return _serverConfig.baseUrl + url;
      }
    } else
      return '';

    //ex : helper.getImagePath('https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg');
    //ex : helper.getImagePath('photos/1591447/pexels-photo-1591447.jpeg');
  }

  double toDouble(dynamic val) {
    if (val != null)
      return double.parse(val.toString());
    else
      return 0;

    //ex : helper.toDouble('12');
  }

  Color getColorFromHexCode(String color) {
    try {
      if (color != null) {
        color = color.replaceAll('#', '');
        String valueString = '0xFF' + color;
        int value = int.parse(valueString);
        return Color(value);
      } else
        return Color(0xFFDBEED3);
    } on Exception catch (e) {
      return Color(0xFFDBEED3);
    }

    //ex : helper.getColorFromHexCode('#TGDU78');
  }

  String currency(val) {
    //var numFormat = NumberFormat.currency(locale: 'hi_IN', symbol: '₹'); //india
    //var numFormat = NumberFormat.currency(locale: 'en_US', symbol: '$'); //us
    var numFormat = NumberFormat.currency(locale: 'de_DE', symbol: '€'); //germany
    return numFormat.format(val);

    //ex : helper.currency(1200);
  }

  jsonGet(json, String path, defaultValue) {
    try {
      List pathSplitter = path.split(".");

      /// <String,dynamic> || String
      var returnValue;

      json.forEach((key, value) {
        var currentPatten = pathSplitter[0];
        int index = 0;

        if (currentPatten.contains('[') && currentPatten.contains(']')) {
          int index1 = currentPatten.indexOf('[');
          int index2 = currentPatten.indexOf(']');

          index = int.parse(currentPatten.substring(index1 + 1, index2));
          currentPatten = currentPatten.substring(0, index1);
        }

        if (key == currentPatten) {
          if (pathSplitter.length == 1) {
            returnValue = value;
            return;
          }

          pathSplitter.remove(pathSplitter[0]);

          if (value == null) {
            returnValue = defaultValue;
            return;
          }
          try {
            try {
              value = value.toJson();
            } catch (error) {
              // handle error
            }

            try {
              if (value is List) {
                value = value[index];
              }
            } catch (error) {
              // handle error
            }

            returnValue = jsonGet(value, pathSplitter.join("."), defaultValue);
          } catch (error) {
            returnValue = defaultValue;
          }
          return;
        }
      });

      return returnValue != null ? returnValue : defaultValue;
    } on Exception catch (e) {
      // TODO
      return defaultValue;
    }

    //ex : helper.jsonGet(jobDetailCtrl.jobData, "salary_range", null);
    //ex : helper.jsonGet(jobDetailCtrl.jobData, "salary_range.from", '');
    //ex : helper.jsonGet(jobDetailCtrl.jobData, "salary_range.from.amount_gross", 0);
    //ex : helper.jsonGet(jobDetailCtrl.jobData, "salary_range[0].from.amount_gross", 'null');
    //ex : helper.jsonGet(jobDetailCtrl.jobData, "salary_range[0].from[1].amount_gross", null);
  }

  bool isNull(val) {
    if (val == null)
      return true;
    else
      return false;

    //ex : helper.isNull(data.val);
  }

  bool isNullOrBlank(dynamic val) {
    if (val is List) {
      if (val == null || val.isEmpty || val.length == 0)
        return true;
      else
        return false;
    } else {
      if (val == null || val == '' || val.toString().isEmpty || val.toString().isBlank)
        return true;
      else
        return false;
    }

    //ex : helper.isNullOrBlank(data.val);
  }

  bool isEmail(String str) {
    RegExp _email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    return _email.hasMatch(str.toLowerCase());
    // ex : helper.isEmail('abc@gmail.com')
  }

  bool isNumeric(String str) {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    return _numeric.hasMatch(str);
    //ex : helper.isNumeric('1')
  }

  bool isInt(String str) {
    RegExp _int = RegExp(r'^(?:-?(?:0|[1-9][0-9]*))$');
    return _int.hasMatch(str);
    //ex : helper.isInt('12242342423')
  }

  bool isJson(str) {
    try {
      json.decode(str);
    } catch (e) {
      return false;
    }
    return true;
    //ex : helper.isJson('{"name":"Mary","age":30}')
  }

  String trim(String str, [String chars]) {
    RegExp pattern = (chars != null) ? RegExp('^[$chars]+|[$chars]+\$') : RegExp(r'^\s+|\s+$');
    return str.replaceAll(pattern, '');
    //ex : helper.trim(' abv ') ==> abv Remove space from starting of the sentence
  }

  String ltrim(String str, [String chars]) {
    var pattern = chars != null ? RegExp('^[$chars]+') : RegExp(r'^\s+');
    return str.replaceAll(pattern, '');
    //ex : helper.trim(' abv') ==> abv  Remove left side space from starting of the sentence
  }

  String rtrim(String str, [String chars]) {
    var pattern = chars != null ? RegExp('[$chars]+\$') : RegExp(r'\s+$');
    return str.replaceAll(pattern, '');
    //ex : helper.trim('abv ') ==> abv  Remove right space from starting of the sentence
  }

  String whitelist(String str, String chars) {
    return str.replaceAll(RegExp('[^' + chars + ']+'), '');
  }

  String blacklist(String str, String chars) {
    return str.replaceAll(RegExp('[' + chars + ']+'), '');
  }

  dynamic filter(dynamic items, dynamic keyValue, string) {
    return items.where((u) => (u['$keyValue'].toString() != null ? u['$keyValue'].toString().toLowerCase().contains(string.toLowerCase()) : false)).toList();
    //ex : helper.filter(items, 'title', 'ab')
  }
}
