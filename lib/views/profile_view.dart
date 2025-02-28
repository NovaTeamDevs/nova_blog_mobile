import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_blog_mobile/controllers/profile_controller.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/constants/app_strings.dart';
import 'package:nova_blog_mobile/core/widgets/custom_button_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_load_net_work_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_text_field.dart';

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
             ProfileButtonWidget(title: "ویرایش نام و نام خانوادگی",onTap: () {
               Get.dialog(Dialog(
                 child: Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     spacing: 16.0,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text("ویرایش نام و نام خانوادگی",style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold)),

                       CustomTextField(label: "نام", hintTxt: "مثلا : محمد",controller: controller.updateUserFirstNameTxt),
                       CustomTextField(label: "نام خانوادگی", hintTxt: "مثلا : دهقانی فرد",controller: controller.updateUserLastNameTxt),

                       CustomButtonWidget(
                            isLoading: controller.updateUserNameLoading,
                           onTap: () async {
                              await controller.updateProfile();
                           },
                           txt: "ذخیره")
                     ],
                   ),
                 ),
               ));
             },),
             ProfileButtonWidget(title: "تغییر رمز عبور",onTap: () {
               Get.dialog(Dialog(
                 child: Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     spacing: 16.0,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text("تغییر رمز عبور ",style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold)),

                       CustomTextField(label: "رمز عبور جدید", hintTxt: "*******",controller: controller.newPassTxt,inputType: TextInputType.visiblePassword,),
                       CustomTextField(label: "تایید رمز عبور", hintTxt: "*******",controller: controller.confirmPassTxt,inputType: TextInputType.visiblePassword,),

                       CustomButtonWidget(
                           isLoading: controller.updateUserNameLoading,
                           onTap: () async {
                             await controller.updatePassword();
                           },
                           txt: "تغییر رمز عبور")
                     ],
                   ),
                 ),
               ));
             },),
             ProfileButtonWidget(title: "خروج از حساب کابری",onTap: () {
               Get.dialog(
                 Dialog(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Column(
                       spacing: 16.0,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text("خروج از حساب کاربری",style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold)),
                         Text("آیا مطمئن هستید که قصد خروج از حساب خود را دارید؟",style: GoogleFonts.vazirmatn(fontSize: 14,color: AppColors.greyColor)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              CustomButtonWidget(onTap: () async {await controller.logOut();}, txt: "خروج",bgColor: AppColors.readColor,width: 120,),
                              CustomButtonWidget(onTap: () {Get.back();}, txt: "لغو",width: 120,),
                            ],
                          )
                       ],
                     ),
                   ),
                 )
               );
             },icon: Icons.login,iconColor: Colors.red),
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
                    radius: 1000,
                      imageUrl: controller.profileInfo!.avatar ?? ""
                  ),
                ),
                TextButton(onPressed: () {
                  Get.bottomSheet(
                      backgroundColor: Colors.white,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20),
                        child: Column(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                controller.takePhoto(source: ImageSource.camera);
                              },
                              child: Row(
                                spacing: 16,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: context
                                        .theme.colorScheme.primary,
                                  ),
                                  Text(
                                    AppStrings.takeNewPhoto,
                                    style: GoogleFonts.vazirmatn(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                                controller.takePhoto(source: ImageSource.gallery);
                              },
                              child: Row(
                                spacing: 16,
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: context
                                        .theme.colorScheme.primary,
                                  ),
                                  Text(
                                    AppStrings.getPhotoFromGallery,
                                    style: GoogleFonts.vazirmatn(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                }, child: Text("تغییر آواتار")),
                 Text("${controller.profileInfo!.firstName!} ${controller.profileInfo!.lastName!}",style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold)),
                 Text(controller.profileInfo!.email!,style: GoogleFonts.vazirmatn(fontSize: 12,color: AppColors.greyColor)),
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
