import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({Key? key, required this.rating, this.starSize = 20,  this.onRating})
      : super(key: key);
  final double rating;
  final double starSize;
  final void Function(double)? onRating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: starSize,
      wrapAlignment: WrapAlignment.start,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate:onRating ?? (rating){},
    );
  }
}
