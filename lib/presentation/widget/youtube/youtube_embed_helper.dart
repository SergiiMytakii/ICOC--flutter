import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'package:icoc/core/constants.dart';

const String youtubeEmbedOrigin = 'https://www.youtube.com';
const String youtubeEmbedReferrerOrigin = ICOC_WEB_PAGE;

String buildYoutubeEmbedUrl({
  required String videoId,
  bool autoplay = true,
  bool mute = false,
  bool showControls = true,
  bool showFullscreenButton = true,
  int? startSeconds,
}) {
  final Map<String, String> queryParameters = <String, String>{
    'playsinline': '1',
    'autoplay': autoplay ? '1' : '0',
    'mute': mute ? '1' : '0',
    'controls': showControls ? '1' : '0',
    'fs': showFullscreenButton ? '1' : '0',
    'enablejsapi': '1',
    'origin': youtubeEmbedOrigin,
    'widget_referrer': youtubeEmbedOrigin,
    'rel': '0',
    'modestbranding': '1',
  };
  if (startSeconds != null && startSeconds > 0) {
    queryParameters['start'] = startSeconds.toString();
  }

  final Uri uri = Uri.https(
    'www.youtube.com',
    '/embed/$videoId',
    queryParameters,
  );
  return uri.toString();
}

String buildYoutubeInlineShortsHtml({
  required String videoId,
  bool autoPlay = true,
  bool mute = true,
}) {
  final String autoplayValue = autoPlay ? '1' : '0';
  final String mutedValue = mute ? '1' : '0';
  final String initialMuteValue = mute ? 'true' : 'false';
  return '''
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    >
    <style>
      html, body {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background: #000;
      }
      #player {
        position: fixed;
        inset: 0;
        width: 100%;
        height: 100%;
        background: #000;
      }
      iframe {
        width: 100%;
        height: 100%;
      }
    </style>
    <script src="https://www.youtube.com/iframe_api"></script>
    <script>
      let player;
      let autoplayInterval;
      let autoplayAttempts = 0;
      let isMuted = $initialMuteValue;

      function clearAutoplayInterval() {
        if (autoplayInterval) {
          clearInterval(autoplayInterval);
          autoplayInterval = null;
        }
      }

      function applyMutedState() {
        try {
          if (!player) return;
          if (isMuted) {
            if (player.mute) player.mute();
            if (player.setVolume) player.setVolume(0);
          } else {
            if (player.unMute) player.unMute();
            if (player.setVolume) player.setVolume(100);
          }
        } catch (_) {}
      }

      function tryAutoplay() {
        autoplayAttempts += 1;
        try {
          if (!player) return;
          applyMutedState();
          player.playVideo();

          const iframe = document.querySelector('iframe');
          if (iframe) {
            iframe.style.opacity = '1';
          }

          const state = player.getPlayerState ? player.getPlayerState() : -1;
          if (state === 1) {
            clearAutoplayInterval();
            return;
          }
        } catch (_) {}

        if (autoplayAttempts >= 30) {
          clearAutoplayInterval();
        }
      }

      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          width: '100%',
          height: '100%',
          videoId: '$videoId',
          host: 'https://www.youtube.com',
          playerVars: {
            autoplay: $autoplayValue,
            controls: 0,
            disablekb: 1,
            fs: 0,
            iv_load_policy: 3,
            loop: 1,
            modestbranding: 1,
            mute: $mutedValue,
            playsinline: 1,
            playlist: '$videoId',
            rel: 0,
            origin: '$youtubeEmbedReferrerOrigin',
            widget_referrer: '$youtubeEmbedReferrerOrigin'
          },
          events: {
            onReady: function() {
              applyMutedState();
              tryAutoplay();
              autoplayInterval = setInterval(tryAutoplay, 250);
            },
            onStateChange: function(event) {
              if (event.data === YT.PlayerState.PLAYING) {
                clearAutoplayInterval();
              } else if (event.data === YT.PlayerState.ENDED) {
                try {
                  player.seekTo(0, true);
                  player.playVideo();
                } catch (_) {}
              }
            }
          }
        });
        window.player = player;
      }

      window.__icocAutoplay = {
        start: function() {
          autoplayAttempts = 0;
          tryAutoplay();
          autoplayInterval = setInterval(tryAutoplay, 250);
        },
        stop: function() {
          clearAutoplayInterval();
        }
      };

      window.__icocAudio = {
        setMuted: function(nextMuted) {
          isMuted = !!nextMuted;
          applyMutedState();
          try {
            if (!isMuted && player && player.playVideo) {
              player.playVideo();
            }
          } catch (_) {}
        }
      };
    </script>
  </head>
  <body>
    <div id="player"></div>
  </body>
</html>
''';
}

String youtubeMobileUserAgent() {
  if (Platform.isIOS) {
    return 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1';
  }
  return 'Mozilla/5.0 (Linux; Android 14; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36';
}

Future<WebViewController> createYoutubeWebViewController({
  required Color backgroundColor,
  required void Function(WebResourceError error) onWebResourceError,
  Future<void> Function(WebViewController controller)? onPageFinished,
}) async {
  late final PlatformWebViewControllerCreationParams params;
  if (Platform.isIOS && WebViewPlatform.instance is WebKitWebViewPlatform) {
    params = WebKitWebViewControllerCreationParams(
      allowsInlineMediaPlayback: true,
      mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
    );
  } else {
    params = const PlatformWebViewControllerCreationParams();
  }

  late final WebViewController controller;
  controller = WebViewController.fromPlatformCreationParams(params)
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(backgroundColor)
    ..setUserAgent(youtubeMobileUserAgent())
    ..setNavigationDelegate(
      NavigationDelegate(
        onWebResourceError: onWebResourceError,
        onPageFinished: (_) async {
          if (onPageFinished != null) {
            await onPageFinished(controller);
          }
        },
      ),
    );

  if (controller.platform is AndroidWebViewController) {
    final AndroidWebViewController androidController =
        controller.platform as AndroidWebViewController;
    androidController.setMediaPlaybackRequiresUserGesture(false);
  }

  return controller;
}

Future<void> loadYoutubeEmbed(
  WebViewController controller, {
  required String videoId,
  bool autoplay = true,
  bool mute = false,
  bool showControls = true,
  bool showFullscreenButton = true,
  int? startSeconds,
}) {
  return controller.loadRequest(
    Uri.parse(
      buildYoutubeEmbedUrl(
        videoId: videoId,
        autoplay: autoplay,
        mute: mute,
        showControls: showControls,
        showFullscreenButton: showFullscreenButton,
        startSeconds: startSeconds,
      ),
    ),
    headers: const <String, String>{
      'Referer': ICOC_WEB_PAGE,
      'Referrer-Policy': 'strict-origin-when-cross-origin',
    },
  );
}

Future<void> loadYoutubeInlineShortsEmbed(
  WebViewController controller, {
  required String videoId,
  bool autoPlay = true,
  bool mute = true,
}) {
  return controller.loadHtmlString(
    buildYoutubeInlineShortsHtml(
      videoId: videoId,
      autoPlay: autoPlay,
      mute: mute,
    ),
    baseUrl: youtubeEmbedReferrerOrigin,
  );
}

Future<void> youtubeMute(WebViewController controller) {
  return controller.runJavaScript('''
    (function() {
      if (window.__icocAudio && window.__icocAudio.setMuted) {
        window.__icocAudio.setMuted(true);
      }
      if (window.player) {
        if (player.mute) player.mute();
        if (player.setVolume) player.setVolume(0);
      }
      const video = document.querySelector('video');
      if (video) {
        video.muted = true;
        video.volume = 0;
      }
    })();
  ''');
}

Future<void> youtubeUnmute(WebViewController controller) {
  return controller.runJavaScript('''
    (function() {
      if (window.__icocAudio && window.__icocAudio.setMuted) {
        window.__icocAudio.setMuted(false);
      }
      if (window.player) {
        if (player.unMute) player.unMute();
        if (player.setVolume) player.setVolume(100);
        if (player.playVideo) player.playVideo();
      }
      const video = document.querySelector('video');
      if (video) {
        video.muted = false;
        video.volume = 1.0;
        const playPromise = video.play();
        if (playPromise && playPromise.catch) playPromise.catch(function() {});
      }
    })();
  ''');
}

Future<void> youtubePlay(WebViewController controller) {
  return controller.runJavaScript('''
    (function() {
      if (window.player && player.playVideo) player.playVideo();
      const video = document.querySelector('video');
      if (video) {
        const playPromise = video.play();
        if (playPromise && playPromise.catch) playPromise.catch(function() {});
      }
    })();
  ''');
}

Future<void> youtubePause(WebViewController controller) {
  return controller.runJavaScript('''
    (function() {
      if (window.player && player.pauseVideo) player.pauseVideo();
      const video = document.querySelector('video');
      if (video) video.pause();
    })();
  ''');
}

Future<void> youtubeEnsureAutoplayMuted(WebViewController controller) {
  return controller.runJavaScript('''
    (function() {
      if (window.__icocAutoplay && window.__icocAutoplay.start) {
        window.__icocAutoplay.start();
      }
      if (window.__icocAutoplayInterval) {
        clearInterval(window.__icocAutoplayInterval);
      }

      let attempts = 0;
      function tryPlay() {
        attempts += 1;
        try {
          if (window.player && player.mute) player.mute();
          if (window.player && player.playVideo) player.playVideo();

          const largePlayButton = document.querySelector('.ytp-large-play-button');
          if (largePlayButton && typeof largePlayButton.click === 'function') {
            largePlayButton.click();
          }

          const shortsPlayButton = document.querySelector('[aria-label="Play"], [aria-label="Pause"]');
          if (shortsPlayButton && typeof shortsPlayButton.click === 'function') {
            const video = document.querySelector('video');
            if (video && video.paused) {
              shortsPlayButton.click();
            }
          }

          const video = document.querySelector('video');
          if (video) {
            video.muted = true;
            const playPromise = video.play();
            if (playPromise && playPromise.catch) {
              playPromise.catch(function() {});
            }

            if (!video.paused && video.readyState >= 2) {
              clearInterval(window.__icocAutoplayInterval);
              window.__icocAutoplayInterval = null;
              return;
            }
          }
        } catch (_) {}

        if (attempts >= 20) {
          clearInterval(window.__icocAutoplayInterval);
          window.__icocAutoplayInterval = null;
        }
      }

      tryPlay();
      window.__icocAutoplayInterval = setInterval(tryPlay, 250);
    })();
  ''');
}

Future<void> youtubeStopAutoplayAttempts(WebViewController controller) {
  return controller.runJavaScript('''
    (function() {
      if (window.__icocAutoplay && window.__icocAutoplay.stop) {
        window.__icocAutoplay.stop();
      }
      if (window.__icocAutoplayInterval) {
        clearInterval(window.__icocAutoplayInterval);
        window.__icocAutoplayInterval = null;
      }
    })();
  ''');
}

Future<double?> youtubeCurrentTime(WebViewController controller) async {
  final Object result = await controller.runJavaScriptReturningResult('''
    (function() {
      if (window.player && player.getCurrentTime) return player.getCurrentTime();
      const video = document.querySelector('video');
      return video ? video.currentTime : 0;
    })();
  ''');
  return _parseJavascriptNumber(result);
}

Future<double?> youtubeDuration(WebViewController controller) async {
  final Object result = await controller.runJavaScriptReturningResult('''
    (function() {
      if (window.player && player.getDuration) return player.getDuration();
      const video = document.querySelector('video');
      return video ? video.duration : 0;
    })();
  ''');
  return _parseJavascriptNumber(result);
}

Future<void> attachYoutubeFullscreenListener(
  WebViewController controller, {
  required String channelName,
}) {
  return controller.runJavaScript('''
    (function() {
      if (window.__icocFullscreenBridgeAttached) return;
      window.__icocFullscreenBridgeAttached = true;
      function isPlayerFullscreen() {
        return !!document.querySelector('.html5-video-player.ytp-fullscreen');
      }
      function notifyFullscreenState() {
        const isFullscreen = isPlayerFullscreen();
        $channelName.postMessage(isFullscreen ? 'enter' : 'exit');
      }
      const observer = new MutationObserver(notifyFullscreenState);
      observer.observe(document.documentElement, {
        subtree: true,
        attributes: true,
        attributeFilter: ['class']
      });
      document.addEventListener('fullscreenchange', notifyFullscreenState);
      document.addEventListener('webkitfullscreenchange', notifyFullscreenState);
      document.addEventListener('webkitbeginfullscreen', notifyFullscreenState);
      document.addEventListener('webkitendfullscreen', notifyFullscreenState);
      setInterval(notifyFullscreenState, 400);
    })();
  ''');
}

double? _parseJavascriptNumber(Object? result) {
  if (result == null) {
    return null;
  }
  if (result is num) {
    final double value = result.toDouble();
    return value.isFinite ? value : null;
  }

  final String normalized =
      result.toString().trim().replaceAll('"', '').replaceAll("'", '');
  if (normalized.isEmpty ||
      normalized == 'null' ||
      normalized == 'undefined' ||
      normalized == 'NaN') {
    return null;
  }

  return double.tryParse(normalized);
}
