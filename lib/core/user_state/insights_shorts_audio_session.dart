class InsightsShortsAudioSession {
  InsightsShortsAudioSession._();

  static bool _isMuted = true;

  static bool get isMuted => _isMuted;

  static void setMuted(bool isMuted) {
    _isMuted = isMuted;
  }

  static void reset() {
    _isMuted = true;
  }
}
