// ignore_for_file: constant_identifier_names

enum ImageItems { HomeBackground, ProductBackground, DummyProductImage }

extension ImageItemsExtension on ImageItems {
  String _path() {
    switch (this) {
      case ImageItems.HomeBackground:
        return "bg_image";
      case ImageItems.ProductBackground:
        return "bg_products";
      case ImageItems.DummyProductImage:
        return "img_dummy_product";
    }
  }

  String get imagePathPng => "assets/images/${_path()}.png";
  String get imagePathJpg => "assets/images/${_path()}.jpg";
}
