import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({super.key, required this.count, required this.selectedIndex});
  final int count;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          count,
          (index) {
            return AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
                duration: Duration(milliseconds: 250),
                width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == index ? context.theme.colorScheme.primary : AppColors.greyColor
              ),
            );
          },
      ),
    );
  }
}
