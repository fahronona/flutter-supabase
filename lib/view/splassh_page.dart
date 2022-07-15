import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_supabase/controller/activity_controller.dart';
import 'package:learn_supabase/controller/home_controller.dart';
import 'package:learn_supabase/view/login_page.dart';
import 'package:learn_supabase/view/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

final activityController = Get.find<ActivityController>();
final homeController = Get.find<HomeController>();
Future<void> _sessionCheck() async {
  await Future.delayed(const Duration(seconds: 2));
  await GetStorage.init();
  final box = Get.find<GetStorage>();
  final session = box.read('user');
  if (session == null || session == "") {
    // Get.off(() => SurahPage());
    Get.off(() => const LoginPage());
  } else {
    homeController.fetchUser(session);
    activityController.fetchActivity();
    Get.off(() => const MainPage());
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.wait([_sessionCheck()]);
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            height: 90,
            width: 90,
          ),
        ),
      ),
    );
  }
}
