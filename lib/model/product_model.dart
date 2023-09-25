class Product {
  int productId;
  String productName;
  double productRating;
  int totalReview;
  double productPrice;
  bool isFavourite;
  List<int> productCategoryId;

  Product({
    required this.productId,
    required this.productName,
    required this.productRating,
    this.totalReview = 0,
    required this.productPrice,
    required this.isFavourite,
    required this.productCategoryId,
  });
}
