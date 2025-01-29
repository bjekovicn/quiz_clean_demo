import 'package:flutter/material.dart';

import '/gen/assets.gen.dart';
import '/ui/shared/widgets/common_loading.dart';

class LandingContent extends StatelessWidget {
  const LandingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.introLogo.path,
            width: 180,
            height: 180,
          ),
          const SizedBox(height: 30),
          const CommonLoading(),
        ],
      ),
    );
  }
}
