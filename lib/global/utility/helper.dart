import 'dart:ffi';

import 'package:flutter_boilerplate/controllers/common/loading_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_boilerplate/global/networking/server_config.dart';

ServerConfig _serverConfig = ServerConfig();

final _storage = GetStorage();
var loadingCtrl = Get.find<LoadingController>();

class Helper {
  dynamic getStorage(String name) {
    dynamic info = _storage.read(name) ?? '';
    return info != '' ? json.decode(info) : info;
  }

  Future<dynamic> writeStorage(String key, dynamic value) async {
    dynamic object = value != null ? json.encode(value) : value;
    return await _storage.write(key, object);
  }

  dynamic removeSpecificKeyStorage(String key) {
    _storage.remove(key);
  }

  clearStorage() {
    _storage.erase();
  }

  getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  getDateString(DateTime date, String patten) {
    return DateFormat(patten ?? 'dd-MM-yyyy').format(date);
  }

  launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : Get.snackbar('error', 'Could not launch $url');
  }

  successMessage(message) => Get.snackbar('success', message, backgroundColor: Colors.green, colorText: Colors.white);
  errorMessage(message) => Get.snackbar('error', message, backgroundColor: Colors.red, colorText: Colors.white);
  alertMessage(message) => Get.snackbar('alert', message, backgroundColor: Colors.yellow, colorText: Colors.black);

  void showLoading() => loadingCtrl.showLoading();
  void hideLoading() => loadingCtrl.hideLoading();

  String getImagePath(String url) {
    if (url.contains('http') || url.contains('https'))
      return url;
    else {
      return _serverConfig.baseUrl + url;
    }
  }

  double toDouble(dynamic val) {
    if (val != null)
      return double.parse(val.toString());
    else
      return 0;
  }

  jsonGet(json, String path, defaultValue) {
    List pathSplitter = path.split(".");

    /// <String,dynamic> || String
    var returnValue;

    json.forEach((key, value) {
      if (key == pathSplitter[0]) {
        if (pathSplitter.length == 1) {
          returnValue = value;
          return;
        }
        pathSplitter.remove(key);

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
          returnValue = jsonGet(value, pathSplitter.join("."), defaultValue);
        } catch (error) {
          returnValue = defaultValue;
        }
        return;
      }
    });

    return returnValue != null ? returnValue : defaultValue;
  }
}
