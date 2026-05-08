class SocialAppModel {
  final String name;
  final String iconPath;
  final String timesOpened;
  final String url; // WebView ke liye URL bhi add kar lein
  bool isEnabled;

  SocialAppModel({
    required this.name,
    required this.iconPath,
    required this.timesOpened,
    required this.url,
    this.isEnabled = false,
  });
}
