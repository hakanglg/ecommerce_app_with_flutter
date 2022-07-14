enum LottieItems { loading }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.loading:
        return "lottie_loading";
    }
  }

  String get lottiePath => "assets/lottie/${_path()}.json";
}
