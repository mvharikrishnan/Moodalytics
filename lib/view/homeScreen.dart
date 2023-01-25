import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moodanalytics/constants/colors.dart';
import 'package:moodanalytics/constants/constantsText.dart';
import 'package:moodanalytics/constants/utils.dart';
import 'package:moodanalytics/model/moodModel.dart';

import 'package:moodanalytics/view/widgets/customContainer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.moodList});
  final List<MoodModel> moodList;

  @override
  Widget build(BuildContext context) {
    // for (var data in moodList) {
    //   log(data.moodRate.toString());
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        title: Text(
          ConstantsNames.companyName,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //User Profile and UserName ROW
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(ConstantsNames.userImageURL),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ConstantsNames.userName,
                        style: TextStyle(fontSize: 20, color: Kwhite),
                      ),
                      Text(
                        ConstantsNames.Developer,
                        style: TextStyle(fontSize: 15, color: Kwhite),
                      ),
                    ],
                  )
                ],
              ),
              Utils.sizedBoxH20,
              CustomContainer(
                height: 0.50,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "How's the",
                              style: TextStyle(
                                  color: Kwhite,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Utils.sizedBoxW10,
                            Text(
                              "Mood",
                              style: TextStyle(
                                  color: KYellow,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Text(
                          "Today",
                          style: TextStyle(
                            color: Kwhite,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Utils.sizedBoxH20,
                    //Emoji here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("😀", style: Utils.emojiStyle),
                        Text("😇", style: Utils.emojiStyle),
                        Text("😑", style: Utils.emojiStyle),
                        Text("😔", style: Utils.emojiStyle),
                        Text("😡", style: Utils.emojiStyle),
                      ],
                    )
                  ],
                ),
              ),
              Utils.sizedBoxH10,
              Utils.customDivider,
              Row(
                children: [
                  Icon(
                    Icons.speed,
                    color: KYellow,
                    size: 40,
                  ),
                  Utils.sizedBoxW10,
                  Text(
                    "Team Mood",
                    style: TextStyle(fontSize: 20, color: Kwhite),
                  ),
                  Utils.sizedBoxW10,
                  Expanded(child: Utils.customRowDivider(2.8, KwhiteGrey)),
                ],
              ),
              Utils.sizedBoxH10,
              CustomContainer(
                height: 0.25,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: '"',
                            style: TextStyle(color: KYellow, fontSize: 20),
                            children: [
                              TextSpan(
                                  text: " The team is feeling good\n   today ",
                                  style: TextStyle(color: Kwhite, fontSize: 20),
                                  children: [
                                    TextSpan(
                                      text: '"',
                                      style: TextStyle(
                                          color: KYellow, fontSize: 20),
                                    ),
                                  ])
                            ]),
                      ),
                      Text(
                        "😇",
                        style: Utils.emojiStyle,
                      ),
                    ],
                  ),
                ),
              ),
              //
              Utils.sizedBoxH10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "😇",
                        style: TextStyle(fontSize: 25),
                      ),
                      Utils.sizedBoxW10,
                      Text(
                        "Moodalytics",
                        style: TextStyle(fontSize: 18, color: Kwhite),
                      )
                    ],
                  ),
                  Text(
                    "(Trend chart on Mood)",
                    style: TextStyle(color: Kwhite, fontSize: 15),
                  )
                ],
              ),
              //graph
              SfCartesianChart(
                primaryXAxis: CategoryAxis(
                    labelRotation: -60, labelPlacement: LabelPlacement.onTicks),
                primaryYAxis: NumericAxis(minimum: 1, maximum: 5, interval: 1),
                series: <ChartSeries<MoodModel, String>>[
                  LineSeries(
                    color: KGreen,
                    dataSource: moodList,
                    xValueMapper: (MoodModel model, _) => model.date,
                    yValueMapper: (MoodModel model, index) => model.moodRate,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
