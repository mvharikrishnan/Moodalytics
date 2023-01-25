class MoodModel {
  MoodModel({required this.date, required this.moodRate});
  final String date;
  final int moodRate;

  static MoodModel fromJson(Map<String, dynamic> json) {
    return MoodModel(
      date: json["created_at"] as String,
      moodRate: json["emoji_point"] as int,
    );
  }
}
