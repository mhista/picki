import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pickafrika/bindings/general_bindings.dart';
import 'package:pickafrika/routes/app_routes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';
import 'package:pickafrika/utils/theme/theme.dart';

import 'utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final isLight = PHelperFunctions.isLightMode(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark
        // systemStatusBarContrastEnforced: true,
        ));
    return GetMaterialApp(
      smartManagement: SmartManagement.keepFactory,
      initialBinding: GeneralBindiings(),
      getPages: AppRoutes.pages,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: PColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
