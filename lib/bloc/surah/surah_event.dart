import 'package:equatable/equatable.dart';

abstract class SurahEvent extends Equatable {}

class SurahGetList extends SurahEvent {
  @override
  List<Object?> get props => [];
}

class SurahTouched extends SurahEvent {
  @override
  List<Object?> get props => [];
}
