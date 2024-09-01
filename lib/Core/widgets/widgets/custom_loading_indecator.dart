import 'package:flutter/cupertino.dart';

import '../../utils/assets_data.dart';

 

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(AssetsData.doctorGIF),fit: BoxFit.fill))),
    );
  }
}
