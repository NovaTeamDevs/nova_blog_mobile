import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/controllers/profile_controller.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/widgets/custom_load_net_work_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Padding(
       padding: const EdgeInsets.all(20.0),
       child: GetBuilder<ProfileController>(
         init: ProfileController(),
           builder: (controller) {
           final List<ProfileButtonWidget> profileOptions = [
             ProfileButtonWidget(title: "ویرایش نام و نام خانوادگی",onTap: () {},),
             ProfileButtonWidget(title: "تغییر رمز عبور",onTap: () {},),
             ProfileButtonWidget(title: "خروج از حساب کابری",onTap: () {},icon: Icons.login,iconColor: Colors.red),
           ];
             return controller.profileInfo == null ? Center(
               child: CircularProgressIndicator(),
             ) : Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CustomLoadNetWorkWidget(
                      imageUrl: controller.profileInfo!.avatar ?? ""
                  ),
                ),
                TextButton(onPressed: () {}, child: Text("تغییر آواتار")),
                 SizedBox(height: 24,),
                Expanded(
                    child: ListView.builder(
                        itemCount: profileOptions.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: ProfileButtonWidget(
                              title: profileOptions[index].title,
                              onTap: profileOptions[index].onTap,
                              iconColor: profileOptions[index].iconColor,
                            icon: profileOptions[index].icon,
                          ),
                        ),
                    )
                )
               ],
             );
           },
       )
     ));
  }
}

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    super.key, required this.title, required this.onTap,this.icon, this.iconColor
  });
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(15),blurRadius: 10)
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: GoogleFonts.vazirmatn(fontWeight: FontWeight.bold,fontSize: 16)),
            Icon(icon ?? Icons.arrow_forward_ios_rounded,color: iconColor ?? AppColors.primaryColor,)
          ],
        ),
      ),
    );
  }
}
