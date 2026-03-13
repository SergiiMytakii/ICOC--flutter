import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/user_state/insights_shorts_audio_session.dart';

void main() {
  tearDown(InsightsShortsAudioSession.reset);

  test('defaults to muted for a fresh session', () {
    expect(InsightsShortsAudioSession.isMuted, isTrue);
  });

  test('keeps mute preference only in memory for the current session', () {
    InsightsShortsAudioSession.setMuted(false);
    expect(InsightsShortsAudioSession.isMuted, isFalse);

    InsightsShortsAudioSession.setMuted(true);
    expect(InsightsShortsAudioSession.isMuted, isTrue);
  });
}
