class QuoteofDay {
 late String qotdDate;
 late Quote quote;

  QuoteofDay({required this.qotdDate, required this.quote});

  QuoteofDay.fromJson(Map<String, dynamic> json) {
    qotdDate = json['qotd_date'];
    quote = (json['quote'] != null ? new Quote.fromJson(json['quote']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qotd_date'] = this.qotdDate;
    if (this.quote != null) {
      data['quote'] = this.quote.toJson();
    }
    return data;
  }
}

class Quote {
 late int id;
 late  bool dialogue;
 late  bool private;
 late  List<String> tags;
 late  String url;
 late  int favoritesCount;
 late  int upvotesCount;
 late  int downvotesCount;
 late  String author;
 late  String authorPermalink;
 late  String body;

  Quote(
      {required this.id,
        required this.dialogue,
        required this.private,
        required this.tags,
        required this.url,
        required  this.favoritesCount,
        required this.upvotesCount,
        required this.downvotesCount,
        required  this.author,
        required this.authorPermalink,
        required this.body});

  Quote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dialogue = json['dialogue'];
    private = json['private'];
    tags = json['tags'].cast<String>();
    url = json['url'];
    favoritesCount = json['favorites_count'];
    upvotesCount = json['upvotes_count'];
    downvotesCount = json['downvotes_count'];
    author = json['author'];
    authorPermalink = json['author_permalink'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dialogue'] = this.dialogue;
    data['private'] = this.private;
    data['tags'] = this.tags;
    data['url'] = this.url;
    data['favorites_count'] = this.favoritesCount;
    data['upvotes_count'] = this.upvotesCount;
    data['downvotes_count'] = this.downvotesCount;
    data['author'] = this.author;
    data['author_permalink'] = this.authorPermalink;
    data['body'] = this.body;
    return data;
  }
}
