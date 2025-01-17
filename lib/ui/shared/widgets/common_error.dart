import 'package:flutter/material.dart';

import 'common_error_icon.dart';
import '/core/extensions/extensions.dart';
import '/core/error_handling/failure.dart';

class CommonError extends StatelessWidget {
  const CommonError({
    super.key,
    this.failure,
  });
  final Failure? failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            failure?.message ?? context.l.error_occurred,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          if (failure != null)
            CommonErrorIcon(failureCode: failure!.code)
          else
            const Icon(Icons.info, size: 40),
        ],
      ),
    );
  }
}
