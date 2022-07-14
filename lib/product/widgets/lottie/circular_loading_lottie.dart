import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/lottie/lottie_enum.dart';

class CircularLoadingLottie extends StatelessWidget {
  const CircularLoadingLottie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(LottieItems.loading.lottiePath, height: 150));
  }
}
