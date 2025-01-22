import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserRank extends StatelessWidget {
  const UserRank({
    super.key,
    required this.rank,
  });
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red[700],
      ),
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: rank >= 3 ? Colors.purple : Colors.amber,
        ),
        child: Center(
          child: Text(
            "${rank + 1}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: rank >= 3 ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class UserRankShimmer extends StatelessWidget {
  const UserRankShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 26,
        height: 26,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
