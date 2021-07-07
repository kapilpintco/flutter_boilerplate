import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

//app file
import 'controllers/common/loading_controller.dart';
import 'global/language/index.dart';
import 'global/packages/config_package.dart';
import 'views/splash_screen.dart';

void main() async {
  await GetStorage.init();

  OneSignal.shared.init(
    "10a70431-5cef-49d4-99fe-18adf431036a",
    iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: false,
    },
  );
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

  Get.put(LoadingController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
        debugShowCheckedModeBanner: false,
        translations: Language(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'), // tran
        title: "My App",
        home: SplashScreen(),
        getPages: appRoute.getPages,
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,
        themeMode: themeService.getThemeMode(),
      ),
    );
  }
}
