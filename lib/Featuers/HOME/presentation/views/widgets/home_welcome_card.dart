import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets_data.dart';
import '../../../../../Core/utils/my_text_styles.dart';
import '../../../../../constants.dart';

class HomeWelcomeCard extends StatelessWidget {
  const HomeWelcomeCard({
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
      child: Container(
        padding: EdgeInsets.all(size.width * 0.047),
        decoration: BoxDecoration(
            color: kSoftPink,
            borderRadius: BorderRadius.circular(curvInHomeView)),
        child: Row(children: [
          Container(
            width: size.width * 0.28,
            height: size.height * 0.14,
            decoration: const BoxDecoration(
                color: kSoftPink,
                image:
                    DecorationImage(image: AssetImage(AssetsData.doctorLogo))),
          ),
          SizedBox(width: size.width * 0.08),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Need Help in Your Medicine WhareHouse?",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: size.height * 0.013,
                ),
                const Text(
                  "We Help you in you work bussines",
                  style: TextStyle(
                      fontWeight: MyTextStyles.thinTextWeight, fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.013,
                ),
                Container(
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                      color: kprimecolor,
                      borderRadius: BorderRadius.circular(curvInHomeView)),
                  child: const Center(
                      child: Text(
                    "Let's Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: MyTextStyles.thinTextWeight),
                  )),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
