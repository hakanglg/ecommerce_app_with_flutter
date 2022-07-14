enum ImageItems { HomeBackground, ProductBackground }

extension ImageItemsExtension on ImageItems {
  String _path() {
    switch (this) {
      case ImageItems.HomeBackground:
        return "bg_image";
      case ImageItems.ProductBackground:
        return "bg_products";
    }
  }

  String get imagePathPng => "assets/images/${_path()}.png";
  String get imagePathJpg => "assets/images/${_path()}.jpg";
}
