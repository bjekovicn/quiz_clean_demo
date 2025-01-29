import 'package:flutter/material.dart';

import '/core/extensions/extensions.dart';
import '/ui/home/widgets/home_card_wrapper.dart';

class StartGameButton extends StatelessWidget {
  const StartGameButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return HomeCardWrapper(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    width: 80,
                    child: child,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall!.copyWith(
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
