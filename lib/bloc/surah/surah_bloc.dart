import 'package:bloc/bloc.dart';
import 'package:quran_app/data/data_providers/common/data_provider_error.dart';
import 'package:quran_app/data/data_providers/quran_package/quran_package.dart';

import 'surah_event.dart';
import 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  SurahBloc() : super(SurahInitialState()) {
    on<SurahGetList>((event, emit) async {
      emit(SurahLoadingState());
      try {
        final _surahList = await _quran.getSurahList();
        emit(SurahLoadedState(_surahList));
      } on DataProviderError catch (dataProviderError) {
        emit(SurahLoadingFailed(message: dataProviderError.message));
      }
    });
  }

  final _quran = QuranPackage.instance;
}
