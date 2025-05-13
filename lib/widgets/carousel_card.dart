import 'package:flutter/material.dart';
import 'dart:math';

class CarouselCard extends StatelessWidget {
  final int index;
  final double offset;

  const CarouselCard({super.key, required this.index, required this.offset});

  @override
  Widget build(BuildContext context) {
    final clampedOffset = offset.clamp(-1.0, 1.0);

    final scale = 1 - (clampedOffset.abs() * 0.3);

    final rotationZ = clampedOffset * pi / 8;

    return Transform(
      alignment: Alignment.center,
      transform:
          Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..translate(0.0, clampedOffset.abs() * -70)
            ..rotateZ(rotationZ)
            ..scale(scale),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.blue[100 * ((index % 8) + 1)],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: offset.abs() < 0.1 ? 0.2 : 0.05,
              ),
              blurRadius: offset.abs() < 0.1 ? 20 : 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        width: 300,
        child: Center(
          child: Text(
            '$index',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
