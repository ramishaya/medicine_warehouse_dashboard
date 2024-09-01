

import 'package:flutter/cupertino.dart';

import '../../../../../Core/utils/my_text_styles.dart';
import 'home_body.dart';

class UserWelcomeText extends StatelessWidget {
  const UserWelcomeText({
    super.key,
    required this.widget,
  });

  final HomeBody widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hello,",
            style: TextStyle(
                fontWeight: MyTextStyles.thinTextWeight,
                fontSize: 18),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.userName,
            style: const TextStyle(
                fontWeight: MyTextStyles.thinTextWeight,
                fontSize: MyTextStyles.bigTextSize),
          )
        ],
      ),
    );
  }
}