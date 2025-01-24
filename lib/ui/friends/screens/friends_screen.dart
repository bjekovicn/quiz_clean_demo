import 'package:flutter/material.dart';

import '/core/extensions/extensions.dart';
import '/ui/friends/widgets/friends_section.dart';
import '/ui/friends/widgets/qr_code_section.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l.friends,
          style: context.textTheme.headlineSmall,
        ),
        automaticallyImplyLeading: true,
      ),
      body: const Column(
        children: [
          QrCodeSection(),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Expanded(
            child: FriendsSection(),
          ),
        ],
      ),
    );
  }
}
