class Quotes {
  late String quoteName;
  late String authorname;
  late String quotebody;

  Quotes({required this.authorname,required this.quotebody,required this.quoteName});

  Quotes.fromJson(Map<String, dynamic> json) {
    quoteName = json['quoteName'];
    authorname = json['author'];
    quotebody = json['quote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quoteName'] = this.quoteName;
    data['author'] = this.authorname;
    data['quote'] = this.quotebody;
    throw 'Error';
  }
}