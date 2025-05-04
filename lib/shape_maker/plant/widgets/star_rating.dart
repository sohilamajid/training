import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final void Function(double)? onRatingChanged;

  const StarRating({
    Key? key,
    this.starCount = 5,
    this.rating = 0.0,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double _currentRating = 0.0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  Widget _buildStar(int index) {
    IconData icon;
    if (index >= _currentRating) {
      icon = Icons.star_border;
    } else if (index > _currentRating - 1 && index < _currentRating) {
      icon = Icons.star_half;
    } else {
      icon = Icons.star;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentRating = index + 1.0;
        });
        if (widget.onRatingChanged != null) {
          widget.onRatingChanged!(_currentRating);
        }
      },
      child: Icon(
        icon,
        color: Colors.amber,
        size: 15.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
      List.generate(widget.starCount, (index) => _buildStar(index)),
    );
  }
}
