import 'package:quran_app/data/data_providers/common/data_provider_error.dart';

class QuranPackageError extends DataProviderError {
  QuranPackageError({int? code, required String message})
      : super(code: code, message: message);
}
