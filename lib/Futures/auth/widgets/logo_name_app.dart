
import 'package:flutter/material.dart';

import '../../../Core/manager/imagesManger.dart';
class LogoOfAppWidget extends StatelessWidget {
  const LogoOfAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(

      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      Image.asset(
      Imagesmanger.factuleyofengginering,
      scale: 2,
      )
      ],
    );
  }
}

