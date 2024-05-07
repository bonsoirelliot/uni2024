class CustomException implements Exception {
  const CustomException({
    required this.title,
    this.subtitle,
    this.parentException,
    this.stackTrace,
  });

  const CustomException.noInternet({
    this.title = 'Соединение отсутствует',
    this.subtitle = 'Как только соединение восстановится, вы снова сможете пользоваться приложением',
    this.parentException,
    this.stackTrace,
  });

  /// Заголовок
  final String title;

  /// Текст
  final String? subtitle;

  /// Родительская ошибка (та, которую изначально отловили)
  final Exception? parentException;

  /// Стек вызовов
  final StackTrace? stackTrace;
}
