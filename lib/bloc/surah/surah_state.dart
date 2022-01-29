import 'package:equatable/equatable.dart';
import 'package:quran_app/data/data_providers/quran_package/quran_package.dart';

abstract class SurahState extends Equatable {}

class SurahInitialState extends SurahState {
  @override
  List<Object?> get props => [];
}

class SurahLoadingState extends SurahState {
  @override
  List<Object?> get props => [];
}

class SurahLoadedState extends SurahState {
  final List<Surah> surahList;

  SurahLoadedState(this.surahList);
  @override
  List<Object?> get props => [surahList];
}

class SurahLoadingFailed extends SurahState {
  final String message;

  SurahLoadingFailed({required this.message});
  @override
  List<Object?> get props => [message];
}
