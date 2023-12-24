import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/view/auth/login/login_view.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/view/home/home_view.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/routes/app_routes.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/theme.dart';

Future<void> main() async {
  runApp(
    /*DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    )*/
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          /*useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,*/
          title: 'PT. Infrastruktur Digital Edukasi - Technical Assignment',
          theme: MyTheme.lightTheme(context),
          routes: {
            Routes.LOGIN: (context) => const LoginView(),
            Routes.HOME: (context) => const HomeView()
          },
          initialRoute: Routes.LOGIN,
          home: const LoginView()
        );
      }
    );
  }
}