import 'package:flutter/material.dart';

import '../../../core/constants/image/image_enum.dart';

class DummyProductImage extends StatelessWidget {
  const DummyProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageItems.DummyProductImage.imagePathPng,
      fit: BoxFit.contain,
    );
  }
}
