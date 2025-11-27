import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:io';
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/presentation/screen/songs/widget/video_card.dart';
import 'package:icoc/presentation/widget/scale_text.dart';
import 'package:logger/logger.dart';

import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class SongVersionTab extends StatefulWidget {
  SongVersionTab({super.key, required this.songVersion});

  final SongVersion songVersion;

  @override
  State<SongVersionTab> createState() => _SongVersionTabState();
}

class _SongVersionTabState extends State<SongVersionTab>
    with SingleTickerProviderStateMixin {
  final log = Logger();

  late AnimationController _controller;
  late Animation<double> _animation;
  bool showVideos = false;
  bool miniPlayerOpened = true;
  bool videoIsPlaying = false;
  YoutubePlayerController? youtubePlayerController;
  WebViewController? iosWebController;
  WebViewController? androidWebController;
  bool iosWebFailed = false;
  bool androidWebFailed = false;
  final ScrollController _scrollController = ScrollController();
  bool _autoScroll = false;
  double _scrollSpeed = 40;
  Timer? _scrollTimer;
  int _transpose = 0;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(
            milliseconds: 500), // Set the duration of the animation
        vsync: this,
        lowerBound: 0.48);
    // Create a curved animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addListener(() {
      setState(() {}); // Trigger a rebuild on each animation frame
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontSizeBloc, FontSizeState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (fontSize) => ScaleText(
            fontSize: fontSize ?? 14,
            child: Column(
              children: [
                if (widget.songVersion.isChords &&
                    _hasChordsFormat(widget.songVersion.text))
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      children: [
                        IconButton(
                          color: ScreenColors.songBook,
                          onPressed: () {
                            setState(() {
                              _transpose -= 1;
                            });
                          },
                          tooltip: 'Transpose down'.tr(),
                          icon: const Icon(Icons.music_note_outlined),
                        ),
                        IconButton(
                          color: ScreenColors.songBook,
                          onPressed: () {
                            setState(() {
                              _transpose += 1;
                            });
                          },
                          tooltip: 'Transpose up'.tr(),
                          icon: const Icon(Icons.music_note),
                        ),
                        IconButton(
                          color: ScreenColors.songBook,
                          onPressed: () {
                            setState(() {
                              _autoScroll = !_autoScroll;
                              if (_autoScroll) {
                                _startAutoScroll();
                              } else {
                                _stopAutoScroll();
                              }
                            });
                          },
                          tooltip: _autoScroll
                              ? 'Pause autoscroll'.tr()
                              : 'Start autoscroll'.tr(),
                          icon: Icon(_autoScroll
                              ? Icons.pause_circle
                              : Icons.play_circle_outline),
                        ),
                        Expanded(
                          child: Tooltip(
                            message: 'Scroll speed'.tr(),
                            child: Slider(
                              value: _scrollSpeed,
                              min: 20,
                              max: 100,
                              activeColor: ScreenColors.songBook,
                              inactiveColor:
                                  ScreenColors.songBook.withValues(alpha: 0.5),
                              onChanged: (v) {
                                setState(() {
                                  _scrollSpeed = v;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: SelectionArea(
                        child: Column(
                          children: [
                            Text(
                              widget.songVersion.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontSize: (fontSize ?? 14) + 5,
                                      fontWeight: FontWeight.bold),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                widget.songVersion.description ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: (fontSize ?? 14),
                                        fontStyle: FontStyle.italic),
                              ),
                            ),
                            const SizedBox(height: 10),
                            widget.songVersion.text.startsWith('<')
                                ? html.Html(
                                    data: (widget.songVersion.isChords &&
                                            _hasChordsFormat(
                                                widget.songVersion.text))
                                        ? _highlightChordsHtml(_applyTranspose(
                                            widget.songVersion.text,
                                            _transpose))
                                        : widget.songVersion.text,
                                    style: {
                                      'body': html.Style(
                                          alignment: Alignment.center,
                                          fontSize:
                                              html.FontSize(fontSize ?? 14)),
                                    },
                                  )
                                : (widget.songVersion.isChords &&
                                        _hasChordsFormat(
                                            widget.songVersion.text))
                                    ? RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: fontSize ?? 14),
                                          children: _buildChordSpans(
                                            _applyTranspose(
                                                widget.songVersion.text,
                                                _transpose),
                                            Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: fontSize ?? 14),
                                            Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: fontSize ?? 14,
                                                    color:
                                                        ScreenColors.songBook,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        widget.songVersion.text,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: fontSize ?? 14),
                                      ),
                            const SizedBox(
                              height: 300,
                            )
                          ],
                        ),
                      )),
                ),
                if ((widget.songVersion.youtubeVideos?.isNotEmpty ?? false) &&
                    !videoIsPlaying)
                  _buldVideoPreview(widget.songVersion.youtubeVideos!),
                if (videoIsPlaying) _miniPlayerBuilder(),
              ],
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  String _applyTranspose(String text, int steps) {
    if (steps == 0) return text;
    final regex = RegExp(
        r'(?<![A-Za-z])(([A-G](?:#|b)?)(?:(?:maj|min|m|dim|aug|sus(?:2|4)?|add)?\d*)?(?:/([A-G](?:#|b)?))?)(?![A-Za-z])');
    return text.replaceAllMapped(regex, (m) {
      final token = m.group(1)!;
      final root = m.group(2)!;
      final bass = m.group(3);
      final preferFlatRoot = root.contains('b');
      final newRoot = _transposeRoot(root, steps, preferFlatRoot);
      var newToken = newRoot + token.substring(root.length);
      if (bass != null) {
        final preferFlatBass = bass.contains('b');
        final newBass = _transposeRoot(bass, steps, preferFlatBass);
        newToken = newToken.replaceFirst('/$bass', '/$newBass');
      }
      return newToken;
    });
  }

  String _transposeRoot(String root, int steps, bool preferFlat) {
    final sharp = [
      'C',
      'C#',
      'D',
      'D#',
      'E',
      'F',
      'F#',
      'G',
      'G#',
      'A',
      'A#',
      'B'
    ];
    final flat = [
      'C',
      'Db',
      'D',
      'Eb',
      'E',
      'F',
      'Gb',
      'G',
      'Ab',
      'A',
      'Bb',
      'B'
    ];
    int idx = sharp.indexOf(root);
    if (idx == -1) idx = flat.indexOf(root);
    if (idx == -1) return root;
    final newIdx =
        (idx + steps) % 12 < 0 ? (12 + (idx + steps) % 12) : (idx + steps) % 12;
    return preferFlat ? flat[newIdx] : sharp[newIdx];
  }

  bool _hasChordsFormat(String text) {
    final raw = _normalizeForDetection(text);
    final lines = raw.split('\n');
    int chordLines = 0;
    int chordTokens = 0;
    for (final l in lines) {
      if (l.trim().isEmpty) continue;
      final count = _countChordTokens(l);
      chordTokens += count;
      final tokens =
          l.trim().split(RegExp(r'\s+')).where((t) => t.isNotEmpty).length;
      if (tokens > 0 && count >= (tokens * 0.6)) chordLines++;
    }
    return chordLines >= 2 || chordTokens >= 5;
  }

  String _normalizeForDetection(String s) {
    var t = s.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n');
    t = t.replaceAll(RegExp(r'<[^>]+>'), ' ');
    return t;
  }

  int _countChordTokens(String line) {
    final tokenRe = RegExp(
        r'^[A-G](?:#|b)?(?:(?:maj|min|m|dim|aug|sus(?:2|4)?|add)?\d*)?(?:/[A-G](?:#|b)?)?$');
    final tokens = line.trim().split(RegExp(r'\s+')).where((t) => t.isNotEmpty);
    int count = 0;
    for (final t in tokens) {
      if (tokenRe.hasMatch(t)) count++;
    }
    return count;
  }

  List<TextSpan> _buildChordSpans(
      String text, TextStyle base, TextStyle chordStyle) {
    final tokenRe = RegExp(
        r'^[A-G](?:#|b)?(?:(?:maj|min|m|dim|aug|sus(?:2|4)?|add)?\d*)?(?:/[A-G](?:#|b)?)?$');
    final lines = text.split('\n');
    final spans = <TextSpan>[];
    for (int i = 0; i < lines.length; i++) {
      final parts =
          lines[i].split(RegExp(r'\s+')).where((t) => t.isNotEmpty).toList();
      for (int j = 0; j < parts.length; j++) {
        final isChord = tokenRe.hasMatch(parts[j]);
        spans.add(TextSpan(text: parts[j], style: isChord ? chordStyle : base));
        if (j < parts.length - 1) spans.add(TextSpan(text: ' ', style: base));
      }
      if (i < lines.length - 1) spans.add(TextSpan(text: '\n', style: base));
    }
    return spans;
  }

  String _highlightChordsHtml(String text) {
    const chordHex = '#ff595e';
    final regex = RegExp(
        r'(?<![A-Za-z])(([A-G](?:#|b)?)(?:(?:maj|min|m|dim|aug|sus(?:2|4)?|add)?\d*)?(?:/([A-G](?:#|b)?))?)(?![A-Za-z])');
    return text.replaceAllMapped(regex, (m) {
      final token = m.group(1)!;
      return '<span style="color: $chordHex">$token</span>';
    });
  }

  void _startAutoScroll() {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 30), (t) {
      if (!_scrollController.hasClients) return;
      final max = _scrollController.position.maxScrollExtent;
      final next = _scrollController.offset + (_scrollSpeed * 0.03);
      if (next >= max) {
        _stopAutoScroll();
        return;
      }
      _scrollController.jumpTo(next);
    });
  }

  void _stopAutoScroll() {
    _scrollTimer?.cancel();
    _scrollTimer = null;
    _autoScroll = false;
  }

  Widget _buldVideoPreview(List<YoutubeVideo> youtubeVideos) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: double.maxFinite,
          color: AdaptiveTheme.of(context).theme.colorScheme.surface,
        ),
        Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: youtubeVideos
                  .map((youtubeVideo) => VideoCard(
                      youtubeVideo: youtubeVideo, onTap: _startPlayVideo))
                  .toList(),
            )),
      ],
    );
  }

  void _startPlayVideo(String videoId) async {
    if (Platform.isIOS) {
      late final PlatformWebViewControllerCreationParams params;
      if (WebViewPlatform.instance is WebKitWebViewPlatform) {
        params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
        );
      } else {
        params = const PlatformWebViewControllerCreationParams();
      }
      final controller = WebViewController.fromPlatformCreationParams(params)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setUserAgent(
            'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1')
        ..setBackgroundColor(
            AdaptiveTheme.of(context).theme.colorScheme.surface)
        ..setNavigationDelegate(NavigationDelegate(onWebResourceError: (e) {
          setState(() {
            iosWebFailed = true;
          });
        }))
        ..loadRequest(
          Uri.parse(
              'https://www.youtube.com/embed/$videoId?playsinline=1&autoplay=1&rel=0&modestbranding=1'),
          headers: const {
            'Referer': ICOC_WEB_PAGE,
            'Referrer-Policy': 'strict-origin-when-cross-origin',
          },
        );
      iosWebController = controller;
      setState(() {
        videoIsPlaying = true;
      });
      _controller.forward();
    } else {
      const params = PlatformWebViewControllerCreationParams();
      final controller = WebViewController.fromPlatformCreationParams(params)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setUserAgent(
            'Mozilla/5.0 (Linux; Android 14; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36')
        ..setBackgroundColor(
            AdaptiveTheme.of(context).theme.colorScheme.surface)
        ..setNavigationDelegate(NavigationDelegate(onWebResourceError: (e) {
          setState(() {
            androidWebFailed = true;
          });
        }))
        ..loadRequest(
          Uri.parse(
              'https://www.youtube.com/embed/$videoId?playsinline=1&autoplay=1&rel=0&modestbranding=1'),
          headers: const {
            'Referer': ICOC_WEB_PAGE,
            'Referrer-Policy': 'strict-origin-when-cross-origin',
          },
        );
      androidWebController = controller;
      setState(() {
        videoIsPlaying = true;
      });
      _controller.forward();
    }
  }

  Widget _miniPlayerBuilder() {
    final screenSize = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: ScreenColors.songBook,
            onPressed: () {
              if (miniPlayerOpened) {
                _controller.reverse();
                setState(() {
                  miniPlayerOpened = false;
                });
              } else {
                _controller.forward();
                setState(() {
                  miniPlayerOpened = true;
                });
              }
            },
            icon: Icon(
                miniPlayerOpened ? Icons.arrow_downward : Icons.arrow_upward),
          ),
          IconButton(
              color: ScreenColors.songBook,
              onPressed: () async {
                _controller.reverse().then((value) => setState(() {
                      videoIsPlaying = false;
                      miniPlayerOpened = true;
                    }));
                if (Platform.isIOS) {
                  iosWebController = null;
                } else {
                  if (youtubePlayerController != null) {
                    await youtubePlayerController!.stopVideo();
                    youtubePlayerController!.close();
                  }
                }
              },
              icon: const Icon(Icons.close_outlined)),
        ],
      ),
      AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: Container(
          width: double.maxFinite,
          height: _animation.value * screenSize.width / 16 * 9,
          child: Platform.isIOS
              ? (!iosWebFailed && iosWebController != null
                  ? WebViewWidget(controller: iosWebController!)
                  : Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final uri = Uri.parse(
                              'https://www.youtube.com/watch?v=${widget.songVersion.youtubeVideos?.first.link ?? ''}');
                          launchUrl(uri, mode: LaunchMode.externalApplication);
                        },
                        child: const Text('Open in YouTube'),
                      ),
                    ))
              : (!androidWebFailed && androidWebController != null
                  ? WebViewWidget(controller: androidWebController!)
                  : Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final uri = Uri.parse(
                              'https://www.youtube.com/watch?v=${widget.songVersion.youtubeVideos?.first.link ?? ''}');
                          launchUrl(uri, mode: LaunchMode.externalApplication);
                        },
                        child: const Text('Open in YouTube'),
                      ),
                    )),
        ),
      )
    ]);
  }
}
