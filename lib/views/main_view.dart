import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/controllers/navigation_controller.dart';
import 'package:nova_blog_mobile/core/widgets/custom_bottom_navigation.dart';
import 'package:nova_blog_mobile/views/categories_view.dart';
import 'package:nova_blog_mobile/views/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(
        init: NavigationController(),
          builder: (controller) {
            return Stack(
              children: [
                Positioned.fill(
                  child: IndexedStack(
                    index: controller.selectedIndex,
                    children: [
                      HomeView(),
                      CategoriesView(),
                      TestScreen(color: Colors.blue),
                      TestScreen(color: Colors.yellow),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavigation(
                      onChange: (newPageIndex) => controller.updatePage(pageIndex: newPageIndex),
                      selectedIndex: controller.selectedIndex,
                    ))
              ],
            );
          },
      )
    );
  }
}



class TestScreen extends StatelessWidget {
  const TestScreen({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
    );
  }
}
