/// Инфо об устройстве и приложении.
class AppMetadata {
  /// Находимся ли мы в релизной сборке.
  final bool isRelease;

  /// И так понятно что это.
  final String appName;

  /// Версия приложения.
  final String appVersion;

  /// Номер сборки.
  final String appBuildNumber;

  /// Время билда.
  final int? appBuildTimestamp;

  /// Название ОС.
  final String systemName;

  /// Версия ОС.
  final String systemVersion;

  /// Кол-во ядер.
  /// Не знаю зачем это нужно, но вдруг пригодится.
  final int processorsCount;

  /// Время запуска приложения.
  final DateTime appLaunchedDateTime;

  /// Текущая локаль.
  final String locale;

  /// И так понятно что это.
  final String deviceVersion;

  /// И так понятно что это.
  final String? deviceScreenSize;

  /// Идентификатор устройства.
  final String? deviceID;

  /// Есть ли у устройства вырезы/отступы снизу
  bool? hasBottomNotch;

  AppMetadata({
    required this.isRelease,
    required this.appName,
    required this.appVersion,
    required this.appBuildNumber,
    required this.systemName,
    required this.systemVersion,
    required this.processorsCount,
    required this.appLaunchedDateTime,
    required this.locale,
    required this.deviceVersion,
    this.hasBottomNotch,
    this.appBuildTimestamp,
    this.deviceScreenSize,
    this.deviceID,
  });

  /*
  String toJson() {
    return jsonEncode(this);
  }*/
}
