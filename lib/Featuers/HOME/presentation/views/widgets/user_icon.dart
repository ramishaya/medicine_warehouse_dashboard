import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/my_text_styles.dart';
import '../../../../../constants.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement('/'); // Make sure this matches the route name in AppRouter

        //                         //queryParameters: {'categoryName': categoryName},  // queryParams is correct for simple data
        //                       );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
                color: kprimecolor,
                borderRadius:
                    BorderRadius.all(Radius.circular(curvInHomeView))),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Logout",
            style: TextStyle(
                fontWeight: MyTextStyles.thinTextWeight, fontSize: 18),
          )
        ],
      ),
    );
  }
}
