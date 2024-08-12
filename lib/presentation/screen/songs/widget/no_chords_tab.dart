import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/presentation/screen/songs/song_book_screen.dart';
import 'package:icoc/presentation/screen/songs/widget/song_version_tab.dart';
import 'package:icoc/presentation/widget/custom_button.dart';

class ChordsTab extends StatefulWidget {
  final SongVersion chords;
  ChordsTab({super.key, required this.chords});

  @override
  State<ChordsTab> createState() => _ChordsTabState();
}

class _ChordsTabState extends State<ChordsTab> {
  bool showChords = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: showChords
          ? SongVersionTab(songVersion: widget.chords)
          : Column(children: [
              Text(
                'There are no chords available for the current language.'.tr(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  onPressed: () {
                    setState(() {
                      showChords = true;
                    });
                  },
                  color: ScreenColors.songBook,
                  child: Text(
                    'Show chords in another language'.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ]),
    );
  }
}
