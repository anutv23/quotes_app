class QuoteCategory {
 late Success success;
 late  Contents contents;
 late  String baseurl;
 late  Copyright copyright;

  QuoteCategory({required this.success, required this.contents, required this.baseurl, required this.copyright});

  QuoteCategory.fromJson(Map<String, dynamic> json) {
    success =
    (json['success'] != null ? new Success.fromJson(json['success']) : null)!;
    contents = (json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null)!;
    baseurl = json['baseurl'];
    copyright = (json['copyright'] != null
        ? new Copyright.fromJson(json['copyright'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.toJson();
    }
    if (this.contents != null) {
      data['contents'] = this.contents.toJson();
    }
    data['baseurl'] = this.baseurl;
    if (this.copyright != null) {
      data['copyright'] = this.copyright.toJson();
    }
    return data;
  }
}

class Success {
  late int total;

  Success({required this.total});

  Success.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}

class Contents {
  late Categories categories;

  Contents({required this.categories});

  Contents.fromJson(Map<String, dynamic> json) {
    categories = (json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.toJson();
    }
    return data;
  }
}

class Categories {
 late String inspire;
 late   String management;
 late   String sports;
 late   String life;
 late  String funny;
 late  String love;
 late  String art;
 late  String students;

  Categories(
      {required this.inspire,
        required  this.management,
        required  this.sports,
        required   this.life,
        required  this.funny,
        required  this.love,
        required this.art,
        required  this.students});

  Categories.fromJson(Map<String, dynamic> json) {
    inspire = json['inspire'];
    management = json['management'];
    sports = json['sports'];
    life = json['life'];
    funny = json['funny'];
    love = json['love'];
    art = json['art'];
    students = json['students'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inspire'] = this.inspire;
    data['management'] = this.management;
    data['sports'] = this.sports;
    data['life'] = this.life;
    data['funny'] = this.funny;
    data['love'] = this.love;
    data['art'] = this.art;
    data['students'] = this.students;
    return data;
  }
}

class Copyright {
 late int year;
 late String url;

  Copyright({required this.year, required this.url});

  Copyright.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['url'] = this.url;
    return data;
  }
}
