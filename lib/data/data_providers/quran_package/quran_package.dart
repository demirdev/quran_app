import 'package:quran/quran.dart' as quran;

class QuranPackage {
  QuranPackage._();
  static final instance = QuranPackage._();

  Future<List<Surah>> getSurahList() async {
    final _surahList = List.generate(quran.getTotalSurahCount(), (index) {
      final _surahNumber = index + 1;
      return Surah(
          surahName: quran.getSurahName(_surahNumber),
          surahNumber: _surahNumber,
          verseCount: quran.getVerseCount(_surahNumber),
          placeOfRevelation: quran.getPlaceOfRevelation(_surahNumber));
    });
    return _surahList;
  }
}

class Surah {
  final String surahName;
  final int surahNumber;
  final int verseCount;
  late final String description;
  final String placeOfRevelation;

  Surah({
    required this.surahName,
    required this.verseCount,
    required this.placeOfRevelation,
    required this.surahNumber,
    // required this.description,
  }) : this.description =
            placeOfRevelation.toUpperCase() + " " + verseCount.toString();
}
