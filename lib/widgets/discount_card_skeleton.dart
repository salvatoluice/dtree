import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DiscountCardSkeleton extends StatelessWidget {
  const DiscountCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 80,
              color: Colors.grey[200],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 20,
              color: Colors.grey[200],
            ),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              height: 12,
              color: Colors.grey[200],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
