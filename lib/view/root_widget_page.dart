import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Machine Task App',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: Scaffold(
            body: Center(
              child: Text('Welcome to Machine Task App!'),
            ),
          ),
        );
      },
    );
  }
}