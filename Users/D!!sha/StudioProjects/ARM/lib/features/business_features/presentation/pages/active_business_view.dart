
import 'package:arm/core/utils/custom_navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/image_manager/image_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/services/url_services.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../../data/models/get_activation_business_data_model.dart';
import '../manager/active_business_controller/active_business_cubit.dart';
import '../manager/active_business_controller/active_business_state.dart';
import '../manager/delete_business_controller/delete_business_cubit.dart';
import '../manager/delete_business_controller/delete_business_state.dart';
import '../manager/get_activation_business_controller/get_activation_business_cubit.dart';
import '../manager/get_activation_business_controller/get_activation_business_state.dart';

class ActiveBusinessView extends StatelessWidget {
  const ActiveBusinessView({
    super.key,
    required this.model,
    required this.id,
    required this.index,
  });

  final GetActivationBusinessDataModel model;
  final int id;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        model.name,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<GetActivationBusinessCubit,
              GetActivationBusinessState>(
            builder: (context, state) {
              if (state is GetActivationBusinessSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        image: DecorationImage(
                            image: NetworkImage(
                              model.logo,
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    Text(
                      'الوصف',
                      style: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: 18,
                      ),
                      textDirection: TextDirection.rtl,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      model.description,
                      style: getMediumStyle(
                        color: ColorManager.grey,
                        fontSize: 12,
                      ),
                      textDirection: TextDirection.rtl,
                      maxLines: 10,
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "الصور",
                        style: getBoldStyle(
                          color: ColorManager.primary,
                          fontSize: 18,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    model.pictures.isEmpty
                        ? Center(
                            child: Text(
                              'مفيش صور',
                              style: getMediumStyle(),
                            ),
                          )
                        : SizedBox(
                            height: 200.h,
                            child: DetailsCustomImageSlider(model.pictures),
                          ),

                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          " خرائط Google",
                          style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "الموقع",
                          style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () async {
                        await UrlServices.launchGoogleMaps(
                            latitude: model.location.latitude,
                            longitude: model.location.longitude);
                      },
                      child:Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(ImageManager.mapImage))),height: 100.h,width: MediaQuery.of(context).size.width,)
                    ),

                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await showCallDialog(
                              context,
                              state.model.data[index].numbers,
                            );
                          },
                          icon: const Icon(
                            Icons.call,
                            color: ColorManager.primary,
                          ),
                        ),
                        Text(
                          'تواصل معنا',
                          style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: 18,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 30.h),
                    DetailsContactUsPart(state.model.data[index]),
                    SizedBox(height: 30.h),

                    BlocBuilder<ActiveBusinessCubit, ActiveBusinessState>(
                      builder: (context, state) {
                        if (state is ActiveBusinessLoadingState) {
                          return const LoadingState();
                        } else {
                          return  CustomButton(
                              text: "موافقه",
                              onPressed: () {
                                BlocProvider.of<ActiveBusinessCubit>(context)
                                    .activeBusiness(id, context,);
                              });
                        }
                      },
                    )  ,
                    SizedBox(height: 20.h),
                    BlocBuilder<DeleteBusinessCubit, DeleteBusinessState>(
                      builder: (context, state) {
                        if (state is DeleteBusinessLoadingState) {
                          return const LoadingState();
                        } else {
                          return CustomButton(
                              text: "حذف",
                              onPressed: ()async{
                                await BlocProvider.of<DeleteBusinessCubit>(context).deleteBusiness( context,id,);
                              },);
                        }
                      },
                    )
                  ],
                );
              } else if (state is GetActivationBusinessFailureState) {
                return FailureState(state.errorMessage);
              } else {
                return const LoadingState();
              }
            },
          ),
        ),
      ),
    );
  }
}

customRow(
  String? text1,
  String? text2,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Expanded(
        child: Text(
          textDirection: TextDirection.rtl,
          text2 ?? "لا يوجد حساب",
          style: getMediumStyle(color: ColorManager.primary),
          maxLines: 10,
        ),
      ),
      SizedBox(width: 10.w),
      Text(
        text1 ?? "لا يوجد نوع للحساب",
        style: getBoldStyle(fontSize: 20),
      ),
    ],
  );
}

class DetailsCustomImageSlider extends StatelessWidget {
  const DetailsCustomImageSlider(this.items, {super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items
          .map(
            (e) => GestureDetector(
              onTap: () async {
                await CustomImageViewer.showImageGallery(context, items);
              },
              child: Container(
                width: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: NetworkImage(
                      e,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        autoPlayAnimationDuration: const Duration(seconds: 4),
      ),
    );
  }
}

class CustomImageViewer {
  static Future<void> showImage(BuildContext context, String image) async {
    await showDialog(
      context: context,
      builder: (context) {
        return PhotoView(
          maxScale: 3.0,
          minScale: 0.3,
          backgroundDecoration: BoxDecoration(
            color: ColorManager.black.withOpacity(0.7),
          ),
          //heroAttributes: PhotoViewHeroAttributes(tag: image),
          loadingBuilder: (context, event) => const LoadingState(),
          onTapUp: (context, details, controllerValue) => context.pop(),
          imageProvider: customCachedImageProvider(image),
        );
      },
    );
  }

  static showImageGallery(BuildContext context, List<String> images) async {
    await showDialog(
      context: context,
      builder: (context) {
        return PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: ColorManager.black.withOpacity(0.7),
          ),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: customCachedImageProvider(images[index]),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
              onTapUp: (context, details, controllerValue) => context.pop(),
              maxScale: 3.0,
              minScale: 0.3,
            );
          },
          itemCount: images.length,
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0.w,
              height: 20.0.h,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded /
                        int.parse(event.expectedTotalBytes.toString()),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailsContactUsPart extends StatelessWidget {
  const DetailsContactUsPart(this.model, {super.key});

  final GetActivationBusinessDataModel model;

  @override
  Widget build(BuildContext context) {
    final List<Links> allLinks = model.links ;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: customBoxShadow(),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 25.w),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...allLinks
                  .map(
                    (e) => GestureDetector(
                      onTap: () async {
                        if (e.type == 'WHATSAPP') {
                          await UrlServices.launchWhatsApp(e.link);
                        } else {
                          await UrlServices.launchLink(e.link);
                        }
                      },
                      child: SizedBox(
                          height: 25.h, child: CustomInActiveSocialLinkIcon(e.type,true)),
                    ),
                  )
                  ,
              ...getRemainingMedia(allLinks).map((e) => SizedBox(
                  height: 25.h, child: CustomInActiveSocialLinkIcon(e,false)))
            ]),
      ),
    );
  }
}

List<String> getRemainingMedia(List<Links> existingMedia) {
  List<String> allMedia = [
    'FACEBOOK',
    'WHATSAPP',
    'TWITTER',
    'INSTAGRAM',
    'YOUTUBE',
    'PERSONAL',
  ];
  for (int i = 0; i < existingMedia.length; i++) {
    if (allMedia.contains(existingMedia[i].type)) {
      allMedia.removeWhere((element) => element == existingMedia[i].type);
    }
  }
  return allMedia;
}

Future<void> showCallDialog(BuildContext context, List<String> numbers) async {
  await showCupertinoDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          //margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
          width: 300.h,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: customBoxShadow(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'اختار رقم الاتصال',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.black,
                    decoration: TextDecoration.none),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 30.h),
              ...numbers
                  .map(
                    (e) => GestureDetector(
                      onTap: () async {
                        await UrlServices.makeCall(e);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.primary,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  )
                  ,
            ],
          ),
        ),
      );
    },
  );
}


class CustomInActiveSocialLinkIcon extends StatelessWidget {
  const CustomInActiveSocialLinkIcon(this.type,this.isActive, {super.key});

  final String type;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Map t = getType(type);

    return FaIcon(
      t['icon'],
      color: isActive ? t['color']: ColorManager.grey,
      size: 40,
    );
  }
}

Map getType(String type) {
  switch (type) {
    case 'FACEBOOK':
      return {
        'icon': FontAwesomeIcons.facebook,
        'color': Colors.lightBlueAccent,
      };

    case 'WHATSAPP':
      return {
        'icon': FontAwesomeIcons.whatsapp,
        'color': Colors.greenAccent,
      };
    case 'TWITTER':
      return {
        'icon': FontAwesomeIcons.xTwitter,
        'color': Colors.black,
      };
    case 'INSTAGRAM':
      return {
        'icon': FontAwesomeIcons.instagram,
        'color': Colors.pinkAccent,
      };
    case 'YOUTUBE':
      return {
        'icon': FontAwesomeIcons.youtube,
        'color': Colors.red,
      };
    default:
      return {
        'icon': FontAwesomeIcons.earthAfrica,
        'color': Colors.yellow,
      };
  }
}
