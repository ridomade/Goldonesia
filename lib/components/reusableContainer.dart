import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;

  const ReusableContainer({
    Key? key,
    required this.begin,
    required this.end,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 149,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
