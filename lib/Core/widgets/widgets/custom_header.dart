import 'package:flutter/material.dart';

import '../../../constants.dart';


class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key,
      required this.scsize,
      required this.title,
      this.subtitle = "",
      this.location = "",
      this.size = 24});
  final String title;
  final String subtitle;
  final String location;
  final double size;
  final Size scsize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: scsize.width*sidesmargin,vertical: scsize.height*verticalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(width: 3.0),
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 7.0,
                height: 7.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kprimecolor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
