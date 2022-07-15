import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_supabase/config/config.dart';
import 'package:learn_supabase/controller/activity_controller.dart';
import 'package:learn_supabase/controller/home_controller.dart';
import 'package:learn_supabase/controller/location_controller.dart';
import 'package:learn_supabase/style/text_style.dart';
import 'package:learn_supabase/view/login_page.dart';
import 'package:learn_supabase/view/widget/card_widget.dart';
import 'package:supabase/supabase.dart';
import 'package:unicons/unicons.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final homeController = Get.find<HomeController>();
  final locationController = Get.put(LocationController());
  final activityController = Get.find<ActivityController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35, left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${homeController.name}",
                              style: AppTextStyle.title
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "${homeController.email}",
                              style: AppTextStyle.small
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: InkWell(
                        onTap: () {
                          homeController.logOut().then((value) {
                            Get.offAll(LoginPage());
                          });
                        },
                        child: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SlideInRight(
              child: Padding(
                padding: EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.place,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your location",
                            style: AppTextStyle.title,
                          ),
                          Text(
                            locationController == null
                                ? ""
                                : locationController.address.value.street
                                        .toString() +
                                    ", " +
                                    locationController
                                        .address.value.administrativeArea
                                        .toString(),
                            style:
                                AppTextStyle.small.copyWith(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 5),
              child: Text(
                "Activity",
                style: AppTextStyle.title,
              ),
            ),
            activityController.isLoading.value
                ? Expanded(
                    child: Center(
                      child: SpinKitDoubleBounce(color: Colors.blue),
                    ),
                  )
                : Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        activityController.fetchActivity();
                      },
                      child: ListView.separated(
                        itemCount: activityController.listActivity.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return FadeInDown(
                            child: cardActivity(
                                activity: activityController.listActivity
                                    .toList()[i]
                                    .name,
                                cost: activityController.listActivity
                                    .toList()[i]
                                    .cost,
                                date: activityController.listActivity
                                    .toList()[i]
                                    .date,
                                location: activityController.listActivity
                                    .toList()[i]
                                    .location),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10);
                        },
                      ),
                    ),
                  ),
          ],
        );
      }),
    );
  }
}
