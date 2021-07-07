import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/controllers/list_view_demo_controller.dart';
import 'package:flutter_boilerplate/global/packages/config_package.dart';
import 'package:flutter_boilerplate/global/widget/no_data_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListViewDemo extends StatelessWidget {
  var listViewCtrl = Get.put(ListViewDemoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => listViewCtrl.scrollCtrl.refresh()),
        child: PagedListView(
          pagingController: listViewCtrl.scrollCtrl,
          //addAutomaticKeepAlives: true,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) => Text(item['name']),
            noItemsFoundIndicatorBuilder: (_) => NoDataWidget(
              title: "No data !",
              body: "no feeds available",
            ),
          ),
        ),
      ),
    );
  }
}
