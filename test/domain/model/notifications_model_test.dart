import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';

void main() {
  group('NotificationsModel.fromJson', () {
    test('parses notifications stored as a list', () {
      final model = NotificationsModel.fromJson({
        'id': 'post-1',
        'notifications': [
          {
            'id': 'en',
            'title': 'Title',
            'text': 'Body',
            'lang': 'en',
          },
        ],
      });

      expect(model.notifications, hasLength(1));
      expect(model.notifications.single.lang, 'en');
      expect(model.notifications.single.title, 'Title');
    });

    test('parses notifications stored as a map', () {
      final model = NotificationsModel.fromJson({
        'id': 'post-1',
        'notifications': {
          'en': {
            'title': 'Title',
            'text': 'Body',
            'lang': 'en',
          },
        },
      });

      expect(model.notifications, hasLength(1));
      expect(model.notifications.single.id, 'en');
      expect(model.notifications.single.lang, 'en');
      expect(model.notifications.single.text, 'Body');
    });
  });
}
