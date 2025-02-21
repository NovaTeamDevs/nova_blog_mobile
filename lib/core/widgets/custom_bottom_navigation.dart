import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, required this.onChange, required this.selectedIndex});
  final Function(int newPageIndex) onChange;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.30),
                    blurRadius: 10
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(iconPath: "assets/svg/home.svg", selected: selectedIndex == 0, onTap: () => onChange(0),),
                  _NavItem(iconPath: "assets/svg/category.svg", selected: selectedIndex == 1, onTap: () => onChange(1),),
                  _NavItem(iconPath: "assets/svg/search.svg", selected: selectedIndex == 2, onTap: () => onChange(2),),
                  _NavItem(iconPath: "assets/svg/user-settings.svg", selected: selectedIndex == 3, onTap: () => onChange(3),),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20,
              child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(width: 3,color: Color(0xFFA4CAFE))
                  ),
                  child: Center(
                    child: Icon(Icons.add,color: AppColors.whiteColor,size: 32,),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}


class _NavItem extends StatelessWidget {
  const _NavItem({required this.iconPath,required this.selected,required this.onTap});
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
          iconPath,
        colorFilter: ColorFilter.mode(selected ? AppColors.primaryColor : AppColors.greyColor , BlendMode.srcIn),
      ),
    );
  }
  
}
