class AccessException implements Exception {
  AccessException([String? message, StackTrace? stackTrace])
      : _message = message,
        stackTrace = stackTrace ?? StackTrace.current;

  late final String? _message;

  final StackTrace? stackTrace;

  @override
  String toString() => _message ?? 'AccessException';
}
