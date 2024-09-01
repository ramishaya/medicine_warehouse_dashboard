import 'package:flutter/material.dart';
 

import '../../../constants.dart';
import '../../utils/my_text_styles.dart';

class ResultCard extends StatelessWidget {
  final Size size;
   const ResultCard({super.key ,  required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: size.width*sidesmargin,vertical: size.height*verticalMargin),
      padding:  EdgeInsets.symmetric(
        horizontal: size.width*sidesmargin,
        vertical: size.height*verticalMargin,
      ),
      decoration: BoxDecoration(
        color: kprimecolor,
        borderRadius: BorderRadius.circular(curvInHomeView),
      ),
      child: Row(
        children: [
          Container(
            width: size.width*0.16,
            height: size.height*0.08,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child:  Icon(
              Icons.assignment_outlined,
              color: kprimecolor,
              size: size.width*0.09,
            ),
          ),
           SizedBox(width: size.width*0.03 / 2),
          const Expanded(
            child: Text(
              "You're Having the best Medicines in the market , because you are a member with us , Let's Go!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: MyTextStyles.thinTextWeight
              ),
            ),
          ),
        ],
      ),
    );
  }
}
