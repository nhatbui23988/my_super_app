


class MiniAppConfigure{
  final String appUrl;
  final String appName;
  final String appIconUrl;
  final bool isEnable;

  const MiniAppConfigure({
    required this.appUrl,
    required this.appName,
    required this.appIconUrl,
    required this.isEnable,
  });

  Map<String, dynamic> toJson() {
    return {
      'appUrl': appUrl,
      'appName': appName,
      'appIconUrl': appIconUrl,
      'isEnable': isEnable,
    };
  }

  factory MiniAppConfigure.fromJson(Map<String, dynamic> map) {
    return MiniAppConfigure(
      appUrl: map['appUrl'] as String,
      appName: map['appName'] as String,
      appIconUrl: map['appIconUrl'] as String,
      isEnable: map['isEnable'] as bool,
    );
  }
}