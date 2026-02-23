import 'package:flutter/material.dart';
import 'package:icoc/domain/data_sources/local/local_bible_db_data_source.dart';
import 'package:icoc/domain/model/bible/bible_reference.dart';
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
  List<String> _translations = <String>[];
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
    final List<String> translations =
        await widget.bibleDb.getAvailableTranslations();
    if (!mounted) {
      return;
    }
    setState(() {
      _translations = translations;
      if (_translations.isNotEmpty &&
          !_translations.contains(_selectedTranslation)) {
        _selectedTranslation = _translations.first;
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
    return Dialog(
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedTranslation,
                      items: _translations
                          .map((String code) => DropdownMenuItem<String>(
                                value: code,
                                child: Text(code.toUpperCase()),
                              ))
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
}
