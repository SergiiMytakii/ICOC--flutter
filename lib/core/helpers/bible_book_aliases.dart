class BibleBookAliases {
  static final Map<String, Map<String, int>> _aliasesByLang =
      <String, Map<String, int>>{
    'en': _buildAliasIndex(_enAliases),
    'uk': _buildAliasIndex(_ukAliases),
    'ru': _buildAliasIndex(_ruAliases),
  };

  static int? resolveBookId(String rawBook, {required String langHint}) {
    final String normalized = normalizeAlias(rawBook);
    final String normalizedLang = langHint.toLowerCase();

    final Map<String, int>? primary = _aliasesByLang[normalizedLang];
    if (primary != null && primary.containsKey(normalized)) {
      return primary[normalized];
    }

    for (final Map<String, int> aliasMap in _aliasesByLang.values) {
      if (aliasMap.containsKey(normalized)) {
        return aliasMap[normalized];
      }
    }
    return null;
  }

  static String normalizeAlias(String value) {
    String out = value.toLowerCase();
    out = out.replaceAll(RegExp(r'[’`ʼ]'), '\'');
    out = out.replaceAll('ё', 'е');
    out = out.replaceAll(RegExp(r"[^a-zа-яіїєґ0-9' ]", unicode: true), ' ');
    out = out.replaceAll(RegExp(r'\s+'), ' ').trim();

    // Normalize ordinal forms used in references, e.g. "1-е" -> "1".
    out = out.replaceAllMapped(
      RegExp(r'^([1-3])\s*(е|й|я)\s+'),
      (Match m) => '${m.group(1)} ',
    );
    // Normalize forms like "1-е до Коринтян" / "1-е к Коринфянам".
    out = out.replaceAllMapped(
      RegExp(r'^([1-3])\s+(до|к)\s+'),
      (Match m) => '${m.group(1)} ',
    );
    // Normalize "Від Марка", "От Марка".
    out = out.replaceAll(RegExp(r'^(від|от)\s+'), '');
    // Normalize "до Римлян" / "к Римлянам".
    out = out.replaceAll(RegExp(r'^(до|к)\s+'), '');
    // Normalize English ordinal forms used in references.
    out = out.replaceAllMapped(
      RegExp(r'^(first|1st)\s+'),
      (Match _) => '1 ',
    );
    out = out.replaceAllMapped(
      RegExp(r'^(second|2nd)\s+'),
      (Match _) => '2 ',
    );
    out = out.replaceAllMapped(
      RegExp(r'^(third|3rd)\s+'),
      (Match _) => '3 ',
    );
    out = out.replaceAllMapped(
      RegExp(r'^(i{1,3})\s+', caseSensitive: false),
      (Match m) {
        final String value = (m.group(1) ?? '').toLowerCase();
        switch (value) {
          case 'i':
            return '1 ';
          case 'ii':
            return '2 ';
          case 'iii':
            return '3 ';
          default:
            return '${m.group(0)}';
        }
      },
    );
    // Normalize common English prefixes.
    out = out.replaceAll(
      RegExp(r'^(the\s+)?gospel\s+according\s+to\s+'),
      '',
    );
    out = out.replaceAll(RegExp(r'^according\s+to\s+'), '');
    out = out.replaceAll(RegExp(r'^(the\s+)?gospel\s+of\s+'), '');
    out = out.replaceAll(RegExp(r'^(epistle|letter)\s+to\s+'), '');
    out = out.replaceAll(RegExp(r'^to\s+'), '');
    out = out.replaceAll(RegExp(r'^of\s+'), '');

    out = out.replaceAll(RegExp(r'\s+'), ' ').trim();
    return out;
  }

  static Map<String, int> _buildAliasIndex(Map<int, List<String>> source) {
    final Map<String, int> index = <String, int>{};
    source.forEach((int bookId, List<String> aliases) {
      for (final String alias in aliases) {
        final String key = normalizeAlias(alias);
        if (key.isNotEmpty) {
          index[key] = bookId;
        }
      }
    });
    return index;
  }

  static final Map<int, List<String>> _ukAliases = <int, List<String>>{
    // Пятикнижие
    1: <String>['Буття', 'Бут', 'Бут.', 'Бт', '1 М', '1 Мойсеева'],
    2: <String>['Вихід', 'Вих', 'Вих.', 'Вихід.', 'Виход', '2 М', '2 Мойсеева'],
    3: <String>['Левит', 'Лев', 'Лев.', 'Лв', '3 М'],
    4: <String>['Числа', 'Чис', 'Чис.', 'Чс', '4 М'],
    5: <String>[
      'Повторення Закону',
      'Повт Зак',
      'Повт. Зак.',
      'Повт',
      'Повт.',
      'Второзаконня',
      'Втор',
      '5 М'
    ],

    // Исторические
    6: <String>['Ісус Навин', 'Іс Нав', 'Навин', 'Нав', 'Нав.', 'Єгошуа'],
    7: <String>['Судді', 'Суд', 'Суд.', 'Книга Суддів'],
    8: <String>['Рут', 'Ру', 'Рут.'],
    9: <String>[
      '1 Самуїла', '1 Сам', '1 Сам.', '1Сам', 'I Сам',
      '1 Царств', '1 Цар', '1Цар', 'I Цар' // Синодальная традиция
    ],
    10: <String>[
      '2 Самуїла',
      '2 Сам',
      '2 Сам.',
      '2Сам',
      'II Сам',
      '2 Царств',
      '2 Цар',
      '2Цар',
      'II Цар'
    ],
    11: <String>[
      '1 Царів', '1 Цар', '1 Цар.', '1Цар', 'I Цар',
      '3 Царств', '3 Цар', '3Цар', 'III Цар' // Синодальная традиция
    ],
    12: <String>[
      '2 Царів', '2 Цар', '2 Цар.', '2Цар', 'II Цар',
      '4 Царств', '4 Цар', '4Цар', 'IV Цар' // Синодальная традиция
    ],
    13: <String>[
      '1 Хронік',
      '1 Хр',
      '1 Хр.',
      '1Хр',
      'I Хр',
      '1 Паралипоменон',
      '1 Пар',
      '1Пар'
    ],
    14: <String>[
      '2 Хронік',
      '2 Хроніки',
      '2 Хр',
      '2 Хр.',
      '2Хр',
      'II Хр',
      '2 Паралипоменон',
      '2 Пар',
      '2Пар'
    ],
    15: <String>['Ездра', 'Езд', 'Езд.', '1 Ездри'],
    16: <String>['Неемія', 'Неем', 'Неем.'],
    17: <String>['Естер', 'Ест', 'Ест.', 'Естерь'],

    // Поэзия
    18: <String>['Йов', 'Іов', 'Йов.', 'Іов.'],
    19: <String>['Псалми', 'Псалом', 'Пс', 'Пс.', 'Псалтир', 'Псалми Давидові'],
    20: <String>['Приповісті', 'Прип', 'Прип.', 'Притчі', 'Притчі Соломона'],
    21: <String>['Екклезіяст', 'Екл', 'Екл.', 'Проповідник', 'Когелет'],
    22: <String>[
      'Пісня над піснями',
      'Пісн',
      'Пісн.',
      'Пісня',
      'Пісня Пісень',
      'ПП'
    ],

    // Пророки
    23: <String>['Ісая', 'Іс', 'Іс.', 'Исая'],
    24: <String>['Єремія', 'Єр', 'Єр.', 'Иеремия'],
    25: <String>['Плач Єремії', 'Пл Єр', 'Пл. Єр.', 'Плач', 'Пл'],
    26: <String>['Єзекіїль', 'Єз', 'Єз.', 'Иезекииль'],
    27: <String>['Даниїл', 'Дан', 'Дан.'],
    28: <String>['Осія', 'Ос', 'Ос.', 'Осия'],
    29: <String>['Йоїл', 'Йоіл', 'Йоіл.', 'Іоїл', 'Иоиль'],
    30: <String>['Амос', 'Ам', 'Ам.'],
    31: <String>['Авдій', 'Авд', 'Авд.', 'Авдий'],
    32: <String>['Йона', 'Іона', 'Йон', 'Йон.', 'Иона'],
    33: <String>['Михей', 'Мих', 'Мих.'],
    34: <String>['Наум', 'На', 'На.'],
    35: <String>['Авакум', 'Ав', 'Ав.'],
    36: <String>['Софонія', 'Соф', 'Соф.', 'Софония'],
    37: <String>['Огій', 'Ог', 'Ог.', 'Аггей'],
    38: <String>['Захарія', 'Зах', 'Зах.'],
    39: <String>['Малахія', 'Мал', 'Мал.'],

    // Новый Завет
    40: <String>[
      'Матвія',
      'Матвій',
      'Мт',
      'Мт.',
      'Мат',
      'Мат.',
      'Євангеліє від Матвія'
    ],
    41: <String>['Марка', 'Мк', 'Мк.', 'Марк', 'Мар.', 'Мр'],
    42: <String>['Луки', 'Лк', 'Лк.', 'Лук', 'Лук.', 'Лука'],
    43: <String>[
      'Івана',
      'Іван',
      'Ів',
      'Ів.',
      'Йоана',
      'Іоанн',
      'Іоан',
      'Іоанна',
      'Ин',
      'Ін'
    ],
    44: <String>[
      'Дії',
      'Дії Апостолів',
      'Діяння',
      'Діяння Апостолів',
      'Ді',
      'Деян',
      'Д.А.'
    ],
    45: <String>['Римлян', 'Рим', 'Рим.', 'До Римлян', 'Рм'],
    46: <String>[
      '1 Коринтян',
      '1 Кор',
      '1 Кор.',
      '1Кор',
      '1Кор.',
      '1 до Коринтян',
      'I Кор',
      'I Коринтян'
    ],
    47: <String>[
      '2 Коринтян',
      '2 Кор',
      '2 Кор.',
      '2Кор',
      '2Кор.',
      'II Кор',
      'II Коринтян'
    ],
    48: <String>['Галатів', 'Гал', 'Гал.', 'До Галатів'],
    49: <String>['Ефесян', 'Еф', 'Еф.', 'До Ефесян'],
    50: <String>['Филипʼян', 'Филипян', 'Флп', 'Флп.', 'Фил'],
    51: <String>[
      'Колосян',
      'Колоссян',
      'Кол',
      'Кол.',
      'До Колосян',
      'До Колоссян'
    ],
    52: <String>[
      '1 Солунян',
      '1 Сол',
      '1 Сол.',
      '1 Фес',
      '1 Фес.',
      '1Сол',
      'I Сол'
    ],
    53: <String>[
      '2 Солунян',
      '2 Сол',
      '2 Сол.',
      '2 Фес',
      '2 Фес.',
      '2Сол',
      'II Сол'
    ],
    54: <String>[
      '1 Тимофія',
      '1 Тим',
      '1 Тим.',
      '1 Тимофею',
      '1 Тимофію',
      '1Тим',
      'I Тим'
    ],
    55: <String>[
      '2 Тимофія',
      '2 Тимофію',
      '2 Тим',
      '2 Тим.',
      '2 Тимофею',
      '2Тим',
      'II Тим'
    ],
    56: <String>['Тита', 'Тит', 'Тит.'],
    57: <String>['Филимона', 'Флм', 'Флм.', 'Флмн'],
    58: <String>['Євреїв', 'Євр', 'Євр.', 'Евр', 'Евр.'],
    59: <String>['Якова', 'Як', 'Як.', 'Иакова'],
    60: <String>['1 Петра', '1 Пет', '1 Пет.', '1Пт', '1 Пт', 'I Пет'],
    61: <String>['2 Петра', '2 Пет', '2 Пет.', '2Пт', '2 Пт', 'II Пет'],
    62: <String>['1 Івана', '1 Ів', '1 Ів.', '1 Ин', '1 Ин.', '1Ів', 'I Ів'],
    63: <String>['2 Івана', '2 Ів', '2 Ів.', '2 Ин', '2 Ин.', '2Ів', 'II Ів'],
    64: <String>['3 Івана', '3 Ів', '3 Ів.', '3 Ин', '3 Ин.', '3Ів', 'III Ів'],
    65: <String>['Юди', 'Юд', 'Юд.', 'Иуды'],
    66: <String>[
      'Обʼявлення',
      'Обявлення',
      'Одкр',
      'Одкр.',
      'Откровение',
      'Апокаліпсис',
      'Апок'
    ],
  };

  static final Map<int, List<String>> _enAliases = <int, List<String>>{
    // Pentateuch
    1: <String>['Genesis', 'Gen', 'Ge', 'Gn'],
    2: <String>['Exodus', 'Exod', 'Exo', 'Ex'],
    3: <String>['Leviticus', 'Lev', 'Le', 'Lv'],
    4: <String>['Numbers', 'Num', 'Nu', 'Nm', 'Nb'],
    5: <String>['Deuteronomy', 'Deut', 'Deu', 'Dt', 'De'],

    // Historical books
    6: <String>['Joshua', 'Josh', 'Jos', 'Jsh'],
    7: <String>['Judges', 'Judg', 'Jdg', 'Jg', 'Jdgs'],
    8: <String>['Ruth', 'Rth', 'Ru'],
    9: <String>[
      '1 Samuel',
      '1 Sam',
      '1Sam',
      '1 Sa',
      '1Sa',
      '1 Sm',
      '1Sm',
      'I Sam',
      'First Samuel',
      '1st Samuel'
    ],
    10: <String>[
      '2 Samuel',
      '2 Sam',
      '2Sam',
      '2 Sa',
      '2Sa',
      '2 Sm',
      '2Sm',
      'II Sam',
      'Second Samuel',
      '2nd Samuel'
    ],
    11: <String>[
      '1 Kings',
      '1 Kgs',
      '1 Kgs.',
      '1Ki',
      '1 Ki',
      '1 Kg',
      '1Kg',
      'I Kgs',
      'First Kings',
      '1st Kings'
    ],
    12: <String>[
      '2 Kings',
      '2 Kgs',
      '2 Kgs.',
      '2Ki',
      '2 Ki',
      '2 Kg',
      '2Kg',
      'II Kgs',
      'Second Kings',
      '2nd Kings'
    ],
    13: <String>['1 Chronicles', '1 Chron', '1 Chr', '1Chr', '1 Ch', 'I Chr'],
    14: <String>['2 Chronicles', '2 Chron', '2 Chr', '2Chr', '2 Ch', 'II Chr'],
    15: <String>['Ezra', 'Ezr', 'Ez'],
    16: <String>['Nehemiah', 'Neh', 'Ne'],
    17: <String>['Esther', 'Esth', 'Est', 'Es'],

    // Poetry and wisdom
    18: <String>['Job', 'Jb'],
    19: <String>['Psalms', 'Psalm', 'Psalm.', 'Ps', 'Psa', 'Psm', 'Pss'],
    20: <String>['Proverbs', 'Prov', 'Pro', 'Prv', 'Pr'],
    21: <String>['Ecclesiastes', 'Eccles', 'Eccl', 'Ecc', 'Qoh', 'Qoheleth'],
    22: <String>[
      'Song of Solomon',
      'Song of Sol',
      'Song of Solom',
      'Song of Songs',
      'Song',
      'Songs',
      'SOS',
      'Canticles',
      'Canticle of Canticles',
      'Cant'
    ],

    // Prophets
    23: <String>['Isaiah', 'Isa', 'Is'],
    24: <String>['Jeremiah', 'Jer', 'Je', 'Jr'],
    25: <String>['Lamentations', 'Lam', 'La'],
    26: <String>['Ezekiel', 'Ezek', 'Eze', 'Ezk'],
    27: <String>['Daniel', 'Dan', 'Da', 'Dn'],
    28: <String>['Hosea', 'Hos', 'Ho'],
    29: <String>['Joel', 'Joe', 'Jl'],
    30: <String>['Amos', 'Amo', 'Am'],
    31: <String>['Obadiah', 'Obad', 'Oba', 'Ob'],
    32: <String>['Jonah', 'Jon', 'Jnh'],
    33: <String>['Micah', 'Mic', 'Mc'],
    34: <String>['Nahum', 'Nah', 'Na'],
    35: <String>['Habakkuk', 'Hab', 'Hb'],
    36: <String>['Zephaniah', 'Zeph', 'Zep', 'Zp'],
    37: <String>['Haggai', 'Hag', 'Hg'],
    38: <String>['Zechariah', 'Zech', 'Zec', 'Zc'],
    39: <String>['Malachi', 'Mal', 'Ml'],

    // New Testament
    40: <String>['Matthew', 'Matt', 'Mat', 'Mt'],
    41: <String>['Mark', 'Mrk', 'Mar', 'Mk', 'Mr'],
    42: <String>['Luke', 'Luk', 'Lk', 'Lu'],
    43: <String>[
      'John',
      'Jn',
      'Jhn',
      'Joh',
      'The Gospel of John',
      'Gospel of John',
      'The Gospel according to John',
      'Gospel according to John'
    ],
    44: <String>['Acts', 'Act', 'Ac', 'Acts of the Apostles'],
    45: <String>['Romans', 'Rom', 'Ro', 'Rm'],
    46: <String>[
      '1 Corinthians',
      '1 Cor',
      '1Cor',
      '1 Co',
      '1Co',
      'I Cor',
      '1st Corinthians',
      'First Corinthians',
      '1 Corinth'
    ],
    47: <String>[
      '2 Corinthians',
      '2 Cor',
      '2Cor',
      '2 Co',
      '2Co',
      'II Cor',
      '2nd Corinthians',
      'Second Corinthians',
      '2 Corinth'
    ],
    48: <String>['Galatians', 'Gal', 'Ga'],
    49: <String>['Ephesians', 'Eph', 'Ep'],
    50: <String>['Philippians', 'Phil', 'Php', 'Pp', 'Philp'],
    51: <String>['Colossians', 'Col'],
    52: <String>[
      '1 Thessalonians',
      '1 Thess',
      '1Thess',
      '1 Thes',
      '1Thes',
      '1 Ths',
      '1Ths',
      '1 Th',
      '1Th',
      'I Thess',
      'First Thessalonians',
      '1st Thessalonians'
    ],
    53: <String>[
      '2 Thessalonians',
      '2 Thess',
      '2Thess',
      '2 Thes',
      '2Thes',
      '2 Ths',
      '2Ths',
      '2 Th',
      '2Th',
      'II Thess',
      'Second Thessalonians',
      '2nd Thessalonians'
    ],
    54: <String>[
      '1 Timothy',
      '1 Tim',
      '1Tim',
      '1 Ti',
      '1Ti',
      'I Tim',
      'First Timothy',
      '1st Timothy'
    ],
    55: <String>[
      '2 Timothy',
      '2 Tim',
      '2Tim',
      '2 Ti',
      '2Ti',
      'II Tim',
      'Second Timothy',
      '2nd Timothy'
    ],
    56: <String>['Titus', 'Tit'],
    57: <String>['Philemon', 'Philem', 'Philem.', 'Phlm', 'Phm', 'Pm'],
    58: <String>['Hebrews', 'Heb', 'He'],
    59: <String>['James', 'Jas', 'Jam', 'Jm'],
    60: <String>[
      '1 Peter',
      '1 Pet',
      '1Pet',
      '1 Pe',
      '1Pe',
      '1 Pt',
      '1Pt',
      'I Pet',
      'First Peter',
      '1st Peter'
    ],
    61: <String>[
      '2 Peter',
      '2 Pet',
      '2Pet',
      '2 Pe',
      '2Pe',
      '2 Pt',
      '2Pt',
      'II Pet',
      'Second Peter',
      '2nd Peter'
    ],
    62: <String>[
      '1 John',
      '1 Jn',
      '1Jn',
      '1 Jhn',
      '1Jhn',
      'I Jn',
      'First John',
      '1st John'
    ],
    63: <String>[
      '2 John',
      '2 Jn',
      '2Jn',
      '2 Jhn',
      '2Jhn',
      'II Jn',
      'Second John',
      '2nd John'
    ],
    64: <String>[
      '3 John',
      '3 Jn',
      '3Jn',
      '3 Jhn',
      '3Jhn',
      'III Jn',
      'Third John',
      '3rd John'
    ],
    65: <String>['Jude', 'Jud', 'Jde'],
    66: <String>[
      'Revelation',
      'Rev',
      'Re',
      'Rv',
      'Apocalypse',
      'Apoc',
      'Revelation of John',
      'The Revelation of John',
      'The Revelation to John'
    ],
  };

  static final Map<int, List<String>> _ruAliases = <int, List<String>>{
    // Пятикнижие
    1: <String>['Бытие', 'Быт', 'Быт.', 'Бт'],
    2: <String>['Исход', 'Исх', 'Исх.'],
    3: <String>['Левит', 'Лев', 'Лев.', 'Лв'],
    4: <String>['Числа', 'Чис', 'Чис.', 'Чс'],
    5: <String>['Второзаконие', 'Втор', 'Втор.', 'Вт'],

    // Исторические
    6: <String>['Иисус Навин', 'Навин', 'Нав', 'Нав.', 'Иис.Нав.'],
    7: <String>['Судьи', 'Суд', 'Суд.'],
    8: <String>['Руфь', 'Руф', 'Руф.'],
    9: <String>[
      '1 Царств', '1 Цар', '1 Цар.', '1Цар', 'I Цар',
      '1 Самуила', '1Сам', '1 Сам', 'I Сам' // Современные переводы
    ],
    10: <String>[
      '2 Царств',
      '2 Цар',
      '2 Цар.',
      '2Цар',
      'II Цар',
      '2 Самуила',
      '2Сам',
      '2 Сам',
      'II Сам'
    ],
    11: <String>[
      '3 Царств', '3 Цар', '3 Цар.', '3Цар', 'III Цар',
      '1 Царей', '1Цар',
      '1 Цар' // Современные переводы (внимание: пересечение с 1 Царств, нужен контекст или приоритизация)
    ],
    12: <String>[
      '4 Царств',
      '4 Цар',
      '4 Цар.',
      '4Цар',
      'IV Цар',
      '2 Царей',
      '2Цар',
      '2 Цар'
    ],
    13: <String>[
      '1 Паралипоменон',
      '1 Пар',
      '1 Пар.',
      '1Пар',
      'I Пар',
      '1 Хроник',
      '1Хр',
      '1 Хр'
    ],
    14: <String>[
      '2 Паралипоменон',
      '2 Пар',
      '2 Пар.',
      '2Пар',
      'II Пар',
      '2 Хроник',
      '2Хр',
      '2 Хр'
    ],
    15: <String>['Ездра', 'Езд', 'Езд.', '1 Ездры'],
    16: <String>['Неемия', 'Неем', 'Неем.'],
    17: <String>['Есфирь', 'Есф', 'Есф.', 'Естерь', 'Эсфирь'],

    // Поэзия
    18: <String>['Иов', 'Иов.'],
    19: <String>['Псалтирь', 'Псалом', 'Пс', 'Пс.', 'Псалмы'],
    20: <String>['Притчи', 'Прит', 'Прит.', 'Притчи Соломона'],
    21: <String>['Екклесиаст', 'Еккл', 'Еккл.', 'Экклесиаст', 'Проповедник'],
    22: <String>['Песнь Песней', 'Песн', 'Песн.', 'Песнь', 'Песни', 'ПП'],

    // Пророки
    23: <String>['Исаия', 'Ис', 'Ис.', 'Исая'],
    24: <String>['Иеремия', 'Иер', 'Иер.'],
    25: <String>['Плач Иеремии', 'Пл Иер', 'Пл. Иер.', 'Плач', 'Пл'],
    26: <String>['Иезекииль', 'Иез', 'Иез.'],
    27: <String>['Даниил', 'Дан', 'Дан.'],
    28: <String>['Осия', 'Ос', 'Ос.'],
    29: <String>['Иоиль', 'Иоил', 'Иоил.'],
    30: <String>['Амос', 'Ам', 'Ам.'],
    31: <String>['Авдий', 'Авд', 'Авд.'],
    32: <String>['Иона', 'Ион', 'Ион.'],
    33: <String>['Михей', 'Мих', 'Мих.'],
    34: <String>['Наум', 'На', 'На.'],
    35: <String>['Аввакум', 'Авв', 'Авв.', 'Ав'],
    36: <String>['Софония', 'Соф', 'Соф.'],
    37: <String>['Аггей', 'Агг', 'Агг.'],
    38: <String>['Захария', 'Зах', 'Зах.'],
    39: <String>['Малахия', 'Мал', 'Мал.'],

    // Новый Завет
    40: <String>['Матфея', 'Матф', 'Матф.', 'Мф', 'Мф.', 'Евангелие от Матфея'],
    41: <String>['Марка', 'Мк', 'Мк.', 'Марк', 'Мр'],
    42: <String>['Луки', 'Лк', 'Лк.', 'Лук'],
    43: <String>['Иоанна', 'Иоанн', 'Ин', 'Ин.', 'Иоан'],
    44: <String>['Деяния', 'Деян', 'Деян.', 'Деяния Апостолов', 'Д.А.'],
    45: <String>['Римлянам', 'Рим', 'Рим.'],
    46: <String>[
      '1 Коринфянам',
      '1 Кор',
      '1 Кор.',
      '1Кор',
      '1Кор.',
      'I Кор',
      '1 Коринф'
    ],
    47: <String>[
      '2 Коринфянам',
      '2 Кор',
      '2 Кор.',
      '2Кор',
      '2Кор.',
      'II Кор',
      '2 Коринф'
    ],
    48: <String>['Галатам', 'Гал', 'Гал.'],
    49: <String>['Ефесянам', 'Еф', 'Еф.', 'Ефес'],
    50: <String>['Филиппийцам', 'Флп', 'Флп.', 'Фил'],
    51: <String>['Колоссянам', 'Кол', 'Кол.'],
    52: <String>[
      '1 Фессалоникийцам',
      '1 Фес',
      '1 Фес.',
      '1 Сол',
      '1Сол',
      'I Фес'
    ],
    53: <String>[
      '2 Фессалоникийцам',
      '2 Фес',
      '2 Фес.',
      '2 Сол',
      '2Сол',
      'II Фес'
    ],
    54: <String>['1 Тимофею', '1 Тим', '1 Тим.', '1Тим', 'I Тим'],
    55: <String>['2 Тимофею', '2 Тим', '2 Тим.', '2Тим', 'II Тим'],
    56: <String>['Титу', 'Тит', 'Тит.'],
    57: <String>['Филимону', 'Флм', 'Флм.'],
    58: <String>['Евреям', 'Евр', 'Евр.'],
    59: <String>['Иакова', 'Иак', 'Иак.', 'Як'],
    60: <String>['1 Петра', '1 Пет', '1 Пет.', '1Пет', 'I Пет'],
    61: <String>['2 Петра', '2 Пет', '2 Пет.', '2Пет', 'II Пет'],
    62: <String>['1 Иоанна', '1 Ин', '1 Ин.', '1Ин', 'I Ин'],
    63: <String>['2 Иоанна', '2 Ин', '2 Ин.', '2Ин', 'II Ин'],
    64: <String>['3 Иоанна', '3 Ин', '3 Ин.', '3Ин', 'III Ин'],
    65: <String>['Иуды', 'Иуд', 'Иуд.'],
    66: <String>['Откровение', 'Откр', 'Откр.', 'Апокалипсис', 'Апок'],
  };
}
