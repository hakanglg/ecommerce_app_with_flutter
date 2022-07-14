import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';
import '../../../core/constants/image/image_enum.dart';

class DefaultSliverAppBar extends StatelessWidget with BaseState {
  DefaultSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.dynamicHeight(.2),
      floating: true,
      pinned: true,
      centerTitle: true,
      backgroundColor: colorConstants.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          ImageItems.ProductBackground.imagePathPng,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
