import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  const CommonImage({
    super.key,
    required this.url,
    this.size = 40,
    this.borderColor,
  });
  final String? url;
  final double size;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
        border: Border.all(
          width: 1,
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: url == null
          ? Icon(
              Icons.person,
              color: Colors.grey[400],
            )
          : CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  url!,
                  errorBuilder: (_, error, __) {
                    return Icon(
                      Icons.person,
                      color: Colors.grey[400],
                    );
                  },
                ),
              ),
            ),
    );
  }
}
