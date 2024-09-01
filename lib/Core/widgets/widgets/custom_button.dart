
import 'package:flutter/material.dart';

import '../../../constants.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;
  final double height;
  final Color color;
  final String? imageIcon;
  final double radius;

  const CustomButton({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    this.radius = curv,
    this.color = kprimecolor,
    this.imageIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageIcon == null
                ? Container()
                : Row(
                    children: [
                      (ImageIcon(
                        AssetImage(imageIcon!),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
            Text(text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
    );
  }
}
