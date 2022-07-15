import 'package:flutter/material.dart';
import 'package:learn_supabase/style/text_style.dart';

Widget cardActivity(
    {String? activity = "",
    String? location = "",
    String? cost = "",
    String? date = ""}) {
  return Padding(
    padding: EdgeInsets.only(right: 18, left: 18, top: 0),
    child: Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  activity!,
                  style: AppTextStyle.title.copyWith(fontSize: 14),
                ),
                Text(
                  location!,
                  style: AppTextStyle.small
                      .copyWith(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cost!,
                  style: AppTextStyle.title
                      .copyWith(fontSize: 14, color: Colors.blue),
                ),
                Text(
                  date!,
                  style: AppTextStyle.small
                      .copyWith(fontSize: 12, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
