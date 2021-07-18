class Category {
 late String categoryId;
  late String categoryName;

  Category({required this.categoryId, required this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['catID'];
    categoryName = json['catName'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catID'] = this.categoryId;
    data['catName'] = this.categoryName;
    throw 'Error';
  }
}