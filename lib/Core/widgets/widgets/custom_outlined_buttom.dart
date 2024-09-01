
import 'package:flutter/material.dart';

import '../../utils/assets_data.dart';

 

class CustomOutlinedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color color;
  final double radius;
  final double height;
  final double width;
  final String? iconImage;
  const CustomOutlinedButton({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    this.color = Colors.white,
    this.radius = 30,
    this.iconImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius), // Rounded border
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconImage == null
                ? Container()
                : Row(
                    children: const [
                      ImageIcon(AssetImage(AssetsData.googleIcon),
                          color: Colors.white, size: 22),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
             Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      ),
    );
  }
}
