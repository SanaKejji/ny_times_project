enum ArticlesPeriod { daily, weekly, monthly }

extension PeriodExtension on ArticlesPeriod {
  int get value {
    switch (this) {
      case ArticlesPeriod.daily:
        return 1;
      case ArticlesPeriod.weekly:
        return 7;
      case ArticlesPeriod.monthly:
        return 30;
    }
  }

  String get nameUpperCase => name.toUpperCase();
}

class MostPopularParams {
  final String section;
  final ArticlesPeriod? period;

  MostPopularParams({
    this.section = 'all-sections',
    this.period,
  });

  Map<String, dynamic> toMap() {
    return {
      'section': section,
      'period': (period ?? ArticlesPeriod.daily).value,
    };
  }
}
