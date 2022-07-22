class ShopModel {
  String? image;
  bool? isFavourite;
  ShopModel({required this.image, required this.isFavourite});

  set setFavourite(bool? isFavourite) => this.isFavourite = isFavourite;
}
