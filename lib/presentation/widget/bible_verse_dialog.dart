import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/domain/data_sources/local/local_bible_db_data_source.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';
import 'package:icoc/domain/model/bible/bible_translation.dart';
import 'package:icoc/domain/model/bible/bible_verse_result.dart';

class BibleVerseDialog extends StatefulWidget {
  final LocalBibleDB bibleDb;
  final BibleReference reference;
  final String initialTranslationCode;
  final ValueChanged<String>? onTranslationSelected;

  const BibleVerseDialog({
    super.key,
    required this.bibleDb,
    required this.reference,
    required this.initialTranslationCode,
    this.onTranslationSelected,
  });

  @override
  State<BibleVerseDialog> createState() => _BibleVerseDialogState();
}

class _BibleVerseDialogState extends State<BibleVerseDialog> {
  late String _selectedTranslation;
  List<BibleTranslation> _translations = <BibleTranslation>[];
  BibleVerseResult? _result;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _selectedTranslation = widget.initialTranslationCode;
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    await widget.bibleDb.ensureInitialized();
    final List<BibleTranslation> translations =
        await widget.bibleDb.getAvailableTranslations();
    if (!mounted) {
      return;
    }
    setState(() {
      _translations = translations;
      final bool selectedExists = _translations.any(
        (BibleTranslation translation) =>
            translation.code == _selectedTranslation,
      );
      if (_translations.isNotEmpty && !selectedExists) {
        _selectedTranslation = _translations.first.code;
      }
    });
    await _loadVerse();
  }

  Future<void> _loadVerse() async {
    if (!mounted) {
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    final BibleVerseResult? result = await widget.bibleDb.getReference(
      widget.reference,
      translationCode: _selectedTranslation,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _result = result;
      _loading = false;
      _error = result == null ? 'Verse not found' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      backgroundColor: isDarkTheme ? const Color(0xFF2A2A2A) : null,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520, maxHeight: 560),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.reference.originalLabel,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              if (_translations.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: const TextScaler.linear(0.95),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Version'.tr(),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.grey.withValues(alpha: 0.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.grey.withValues(alpha: 0.5)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.grey.withValues(alpha: 0.5)),
                        ),
                      ),
                      initialValue: _selectedTranslation,
                      itemHeight: 48,
                      menuMaxHeight: 320,
                      iconSize: 20,
                      style: Theme.of(context).textTheme.bodyMedium,
                      items: _translations
                          .map(
                            (BibleTranslation translation) =>
                                DropdownMenuItem<String>(
                              value: translation.code,
                              child: Text(
                                _localizedName(context, translation),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) async {
                        if (value == null || value == _selectedTranslation) {
                          return;
                        }
                        setState(() {
                          _selectedTranslation = value;
                        });
                        widget.onTranslationSelected?.call(value);
                        await _loadVerse();
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              if (_loading)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (_error != null)
                Expanded(
                  child: Center(
                    child: Text(
                      _error!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
              else
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectionArea(
                      child: Text(
                        _result!.verses
                            .map((BibleVerseLine line) =>
                                '${line.verse} ${line.text}')
                            .join('\n\n'),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _localizedName(BuildContext context, BibleTranslation translation) {
    final String uk = 'uk'.tr();
    final String ru = 'ru'.tr();
    final String en = 'en'.tr();
    final String contemporary = 'bible_variant_contemporary'.tr();
    final String ohienko = 'bible_variant_ohienko'.tr();
    final String kulish = 'bible_variant_kulish'.tr();
    final String synodal = 'bible_variant_synodal'.tr();
    final String rsp = 'bible_variant_rsp'.tr();

    final String label = switch (translation.code) {
      'uk_tub' => '$uk ($contemporary)',
      'uk_ohienko' => '$uk ($ohienko)',
      'uk_kulish' => '$uk ($kulish)',
      'ru_wbtc' => '$ru ($contemporary)',
      'ru_synodal' => '$ru ($synodal)',
      'ru_rsp' => '$ru ($rsp)',
      'en_easy' => '$en ($contemporary)',
      'en_asv' => '$en (ASV)',
      'en_kjv' => '$en (KJV)',
      _ => translation.name,
    };

    // If localization key is missing, EasyLocalization returns the key itself.
    if (label.contains('bible_variant_')) {
      return translation.name;
    }
    return label;
  }
}
