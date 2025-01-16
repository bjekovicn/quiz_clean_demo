import 'package:flutter/cupertino.dart';

import '/core/extensions/extensions.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              radius: 22,
            ),
            const SizedBox(height: 12),
            Text(
              text ?? context.l.loading,
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
