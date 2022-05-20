import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRatingBar extends StatelessWidget {
  final double rating;
  final List<Star> stars;

  StarRatingBar(this.rating, {Key? key})
      : stars = List.generate(5, (index) {
          var isLastIndex = index == 4;
          if (rating >= index + 1) {
            return Star(Icons.star, isLastIndex);
          } else if (rating > index && rating < index + 1) {
            return Star(Icons.star_half, isLastIndex);
          } else {
            return Star(Icons.star_border, isLastIndex);
          }
        }),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.from(stars.map((e) => Padding(
            padding: EdgeInsets.only(right: e.isLast ? 0 : 5.33),
            // child: SizedBox(
            // width: 14.67,
            // TODO: add missing assets so that stars are half filled or empty depending on rating.
            // child: Icon(e.icon, color: const Color(0xFFFFD42C)))))));
            child: SvgPicture.asset('./images/star_full.svg'))))
        // )
        );
  }
}

class Star {
  final IconData icon;
  final bool isLast;

  Star(this.icon, this.isLast);
}
