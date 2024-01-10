import 'package:flutter/material.dart';
import 'package:goldonesia/constants/color.dart';

class ReusableTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const ReusableTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    final Animation<double> curve =
        CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
    alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    controller?.addListener(() {
      setState(() {});
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller?.forward();
      } else {
        controller?.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: ShapeDecoration(
          color: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          shadows: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(1, 5),
                spreadRadius: 0),
          ],
        ),
        child: Theme(
          data: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: blue,
                ),
          ),
          child: CustomPaint(
            painter: CustomAnimateBorder(alpha.value),
            child: TextField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: widget.label,
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              autocorrect: false,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAnimateBorder extends CustomPainter {
  final double animationPercent; // 0.0 to 1.0
  CustomAnimateBorder(this.animationPercent);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Colors.cyan;
    paint.style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
