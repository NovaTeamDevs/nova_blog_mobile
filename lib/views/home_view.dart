import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/controllers/home_controller.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/widgets/custom_indicator_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_load_net_work_widget.dart';
import 'package:nova_blog_mobile/core/widgets/post_item_widget.dart';
import 'package:nova_blog_mobile/views/single_post_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();

  void onScroll() {
    if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
      Get.find<HomeController>().getHomePost();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

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
                  Row(
                    children: [
                      Text("اخرین پست های منتشر شده",style: GoogleFonts.vazirmatn(fontSize: 14,color: AppColors.greyColor),),
                      Spacer(),
                      Text(" تعداد مقالات : ${controller.postList?.length}",style: GoogleFonts.vazirmatn(fontSize: 14,color: AppColors.greyColor),),
                    ],
                  ),
                  SizedBox(height: 16.0,),
                  Expanded(
                      child: controller.postList == null ? Center(child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator())) : ListView.builder(
                          controller: scrollController,
                          itemCount: controller.postList!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () => Get.to(SinglePostView(id: controller.postList![index].id!)),
                                child: PostItemWidget(post: controller.postList![index]));
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


