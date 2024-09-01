import 'package:flutter/material.dart';

import '../../../../../Core/utils/my_text_styles.dart';
import '../../../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: EdgeInsets.symmetric(
          horizontal: size.width * sidesmargin,
          vertical: size.height * verticalMargin),
      child: Row(
      children: [
        const Text('Available Services',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: MyTextStyles.thinTextWeight,
            )),
        const SizedBox(width: 7.0),
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
    );
  }
}
