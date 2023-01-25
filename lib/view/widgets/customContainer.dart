import 'package:flutter/cupertino.dart';
import 'package:moodanalytics/constants/colors.dart';
import 'package:moodanalytics/constants/utils.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(8.0),
        height: height * size.width,
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(color: KYellow),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment(0.0, -1),
            end: Alignment(0.0, 0.1),
            colors: [
              KwhiteGrey,
              backGroundColor,
            ],
          ),
        ),
        child: child);
  }
}
