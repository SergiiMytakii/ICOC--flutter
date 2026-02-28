import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';

void main() {
  test('Post.fromJson parses new fields', () {
    final Timestamp createdAt = Timestamp.fromDate(DateTime(2025, 1, 1));

    final Post post = Post.fromJson(<String, dynamic>{
      'id': 'post-1',
      'type': 'video',
      'language': 'en',
      'content': 'Caption',
      'youtubeId': 'abc123',
      'mediaAspectRatios': <double>[1.5],
      'author': <String, dynamic>{'name': 'Alex', 'avatarUrl': ''},
      'createdAt': createdAt,
      'status': 'published',
      'allowComments': false,
      'likes': 12,
      'commentsCount': 4,
      'shares': 2,
    });

    expect(post.type, PostType.video);
    expect(post.youtubeId, 'abc123');
    expect(post.mediaAspectRatios, <double>[1.5]);
    expect(post.allowComments, false);
    expect(post.likes, 12);
    expect(post.commentsCount, 4);
    expect(post.shares, 2);
  });

  test('Post.fromJson parses image carousel media', () {
    final Post post = Post.fromJson(<String, dynamic>{
      'id': 'post-2',
      'type': 'image',
      'language': 'uk',
      'mediaUrls': <String>[
        'https://example.com/1.jpg',
        'https://example.com/2.jpg',
      ],
      'mediaAspectRatios': <double>[1, 0.8],
      'author': <String, dynamic>{'name': 'Legacy', 'avatarUrl': ''},
      'createdAt': Timestamp.fromDate(DateTime(2024, 1, 1)),
    });

    expect(post.type, PostType.image);
    expect(
      post.mediaUrls,
      <String>['https://example.com/1.jpg', 'https://example.com/2.jpg'],
    );
    expect(post.aspectRatioForIndex(1), 0.8);
    expect(post.status, 'published');
    expect(post.allowComments, true);
    expect(post.likes, 0);
    expect(post.commentsCount, 0);
    expect(post.shares, 0);
  });
}
