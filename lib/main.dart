import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_supabase/config/config.dart';
import 'package:learn_supabase/controller/activity_controller.dart';
import 'package:learn_supabase/controller/home_controller.dart';
import 'package:learn_supabase/view/login_page.dart';
import 'package:learn_supabase/view/splassh_page.dart';
import 'package:supabase/supabase.dart';

void main() {
  GetIt locator = GetIt.instance;
  locator.registerSingleton<SupabaseClient>(
      SupabaseClient(GlobalConfig.SUPABASE_URL, GlobalConfig.SUPABASE_KEY));
  Get.put<GetStorage>(GetStorage());
  Get.put<ActivityController>(ActivityController());
  Get.put<HomeController>(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
