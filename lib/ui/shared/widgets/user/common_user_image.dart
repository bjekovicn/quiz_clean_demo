import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonUserImage extends StatelessWidget {
  const CommonUserImage({
    super.key,
    this.imageUrl,
    this.size,
  });
  final String? imageUrl;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 80,
      width: size ?? 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 4,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: imageUrl == null
            ? const Icon(Icons.account_circle_outlined)
            : Image.network(
                imageUrl!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class CommonUserImageShimmer extends StatelessWidget {
  const CommonUserImageShimmer({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: size ?? 80,
        width: size ?? 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.amber,
            width: 2,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 4,
              offset: const Offset(2, 4),
            ),
          ],
        ),
      ),
    );
  }
}
