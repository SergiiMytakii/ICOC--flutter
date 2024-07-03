class News {
  News(
      {this.id,
      this.publicationDate,
      this.title,
      this.excerpt,
      this.content,
      this.imageUrl,
      this.categories});
  final int? id;
  final DateTime? publicationDate;
  final String? title;
  final String? excerpt;
  final String? content;
  final String? imageUrl;
  final List<int>? categories;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'],
        publicationDate: DateTime.parse(json['date']),
        title: Guid.fromJson(json['title']).rendered,
        content: Content.fromJson(json['content']).rendered,
        excerpt: Content.fromJson(json['excerpt']).rendered,
        imageUrl: BetterFeaturedImage.fromJson(json['better_featured_image'])
            .sourceUrl,
        categories: List<int>.from(json['categories'].map((x) => x)),
      );
}

class BetterFeaturedImage {
  BetterFeaturedImage({
    this.id,
    this.altText,
    this.caption,
    this.description,
    this.post,
    this.sourceUrl,
  });

  final int? id;
  final String? altText;
  final String? caption;
  final String? description;

  final int? post;
  final String? sourceUrl;

  factory BetterFeaturedImage.fromJson(Map<String, dynamic> json) =>
      BetterFeaturedImage(
        id: json['id'],
        altText: json['alt_text'],
        caption: json['caption'],
        description: json['description'],
        post: json['post'],
        sourceUrl: json['source_url'],
      );
}

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  final String? rendered;
  final bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json['rendered'],
        protected: json['protected'],
      );

  Map<String, dynamic> toJson() => {
        'rendered': rendered,
        'protected': protected,
      };
}

class Guid {
  Guid({
    this.rendered,
  });

  final String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json['rendered'],
      );
}
