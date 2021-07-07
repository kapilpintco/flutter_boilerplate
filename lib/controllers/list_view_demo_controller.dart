import 'package:flutter_boilerplate/global/packages/config_package.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListViewDemoController extends GetxController {
  final PagingController scrollCtrl = PagingController(firstPageKey: 0);
  int _pageSize = 15;

  @override
  void onInit() {
    scrollCtrl.addPageRequestListener((pageKey) {
      getData(pageKey);
    });
    super.onInit();
  }

  @override
  void onReady() {
    getData(0);
    super.onReady();
  }

  Future<void> getData(pageKey) async {
    try {
      List formData = [
        {"key": "skip", "value": pageKey},
        {"key": "take", "value": _pageSize},
      ];

      await apis.getApi(apiMethods.offers, formData).then((resData) async {
        if (resData.isSuccess == true) {
          var data = resData.data['data'];
          final isLastPage = data.length < _pageSize;

          if (isLastPage) {
            scrollCtrl.appendLastPage(data);
          } else {
            final nextPageKey = pageKey + data.length;
            scrollCtrl.appendPage(data, nextPageKey);
          }
          update();
        } else {
          print("API Method Error");
          scrollCtrl.error = resData.message;
        }
      });
    } on Exception catch (e) {
      print("Function Error");
      scrollCtrl.error = e;
    }
  }
}
