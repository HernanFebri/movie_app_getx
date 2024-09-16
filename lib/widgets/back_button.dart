import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(
        top: 8,
        left: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}
