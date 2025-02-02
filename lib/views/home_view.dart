import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/controllers/home_controller.dart';
import 'package:nova_blog_mobile/core/widgets/custom_indicator_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_load_net_work_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/png/logo.png",scale: 2),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<HomeController>(
          init: HomeController(),
            builder: (controller) {
              return Column(
                children: [
                  CarouselSlider(
                      items: [
                        CustomLoadNetWorkWidget(
                          imageUrl: "https://novadev.ir/wp-content/uploads/2024/03/flipsnack-Hp4RPL_Z6wE-unsplash-900x520.jpg",
                        ),
                        CustomLoadNetWorkWidget(
                          imageUrl: "https://novadev.ir/wp-content/uploads/2024/03/digitalmarketing-important-900x520.jpg",
                        ),
                        CustomLoadNetWorkWidget(
                          imageUrl: "https://novadev.ir/wp-content/uploads/2024/03/Website-Design-800x520.jpg",
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                          onPageChanged: (index, reason) {
                            controller.updateSliderIndicator(index);
                          },
                          height: 250,
                          viewportFraction: 1
                      )
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: CustomIndicatorWidget(
                      count: 3,
                      selectedIndex: controller.selectedSliderIndex,
                    ),
                  )
                ],
              );
            },
        )
      ),
    );
  }
}
