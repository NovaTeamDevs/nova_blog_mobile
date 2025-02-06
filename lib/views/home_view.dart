import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/controllers/home_controller.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                  SizedBox(height: 12.0,),
                  Text("اخرین پست های منتشر شده",style: GoogleFonts.vazirmatn(fontSize: 14,color: AppColors.greyColor),),
                  SizedBox(height: 16.0,),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 24),
                              child: Row(
                                spacing: 16.0,
                                children: [
                                  CustomLoadNetWorkWidget(
                                      imageWidth: 120,
                                      imageHeight: 120,
                                      imageUrl: "https://novadev.ir/wp-content/uploads/2024/03/flipsnack-Hp4RPL_Z6wE-unsplash-416x231.jpg"),
                                  Column(
                                    spacing: 8.0,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 230,
                                        child: Text(
                                          "نقشه راه یادگیری برنامه نویسی پایتون",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.vazirmatn(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                      ),
                                      Text("نویسنده : محمد دهقانی فرد",style: GoogleFonts.vazirmatn(fontSize: 12,color: AppColors.greyColor),),
                                      Text("دسته بندی : تکنولوژی",style: GoogleFonts.vazirmatn(fontSize: 12,color: AppColors.greyColor),)
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                      )
                  ),
                  SizedBox(height: 48.0,),
                ],
              );
            },
        )
      ),
    );
  }
}
