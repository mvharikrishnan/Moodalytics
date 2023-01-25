import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moodanalytics/constants/constantsText.dart';
import 'package:moodanalytics/model/moodModel.dart';

class Services {
  static Future<List<MoodModel>> getMoodResponse() async {
    final url = Uri.parse(ConstantsNames.moodalyticsURL);

    final response = await http
        .get(url, headers: {"Authorization": ConstantsNames.authorization});
    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      List moodBody = decodedBody['moodalytics'];

      List<MoodModel> moodalyticsList = [];
      for (var mood in moodBody) {
        moodalyticsList.add(MoodModel.fromJson(mood));
      }

      return moodalyticsList;
    } else {
      return [];
    }
  }
}
