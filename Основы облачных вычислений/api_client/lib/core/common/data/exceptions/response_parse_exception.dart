@Deprecated('Надо будет убрать, т.к. есть CheckedFormatException')
class ResponseParseException implements Exception {
  @Deprecated('Надо будет убрать, т.к. есть CheckedFormatException')
  ResponseParseException([
    this._message,
    StackTrace? stackTrace,
    this.data,
  ]) : stackTrace = stackTrace ?? StackTrace.current;

  late final String? _message;

  final StackTrace? stackTrace;

  final Map<String, dynamic>? data;

  @override
  String toString() => _message ?? 'ResponseParseExeption';
}
