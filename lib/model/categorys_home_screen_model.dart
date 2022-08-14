class CategorysModel {
  String image;
  String categoryName;
  String questionNumbers;
  String? description;
  CategorysModel({
    required this.categoryName,
    required this.image,
    required this.questionNumbers,
    this.description,
  });
}
