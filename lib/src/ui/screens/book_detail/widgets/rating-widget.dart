import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  Rating({@required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    if (rate == null) return SizedBox();
    return Container(
      child: Row(
        children: <Widget>[
          starIcon(rate: rate, value: 1),
          starIcon(rate: rate, value: 2),
          starIcon(rate: rate, value: 3),
          starIcon(rate: rate, value: 4),
          starIcon(rate: rate, value: 5)
        ],
      ),
    );
  }

  Widget starIcon({@required double rate, @required int value}) {
    if (rate >= value) {
      return Icon(Icons.star);
    }

    return Icon(Icons.star_border);
  }
}
