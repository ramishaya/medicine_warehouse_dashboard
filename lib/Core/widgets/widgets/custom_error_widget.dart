import 'package:flutter/cupertino.dart';

import '../../utils/my_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: const TextStyle(
            color: MyTextStyles.mytextColor,
            fontWeight: MyTextStyles.thinTextWeight,
            fontSize: MyTextStyles.bigTextSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
