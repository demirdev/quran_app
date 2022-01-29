abstract class DataProviderError implements Exception {
  final int? code;
  final String message;

  DataProviderError({this.code, required this.message});
}
