import '../controller/blog_controller.dart';
import '../models/blog_item_model.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

// ignore: must_be_immutable
class BlogItemWidget extends StatelessWidget {
  BlogItemWidget(
    this.blogItemModelObj, {
    Key? key,
    this.onTapBlog,
  }) : super(
          key: key,
        );

  BlogItemModel blogItemModelObj;

  var controller = Get.find<BlogController>();

  VoidCallback? onTapBlog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBlog?.call();
      },
      child: Container(
        padding: getPadding(
          top: 4,
          bottom: 4,
        ),
        decoration: AppDecoration.fill10.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomImageView(
              imagePath: blogItemModelObj.image,
              height: getSize(
                100,
              ),
              width: getSize(
                100,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  16,
                ),
              ),
            ),
            SizedBox(width: getHorizontalSize(12),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    blogItemModelObj.title!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Text(
                      blogItemModelObj.subTitle!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodyMediumBlack900,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      blogItemModelObj.date!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodyMediumGray700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
