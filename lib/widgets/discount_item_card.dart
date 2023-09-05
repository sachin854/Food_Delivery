import 'package:flutter/material.dart';

import '../resources/constants/color.dart';
import '../resources/constants/dimensions.dart';
import 'component/text_widget.dart';

class DiscountCard extends StatefulWidget {
  String img;
  String foodTitle;
  String distance;
  String ratings;
  String foodPrice;
  String deliveryCharges;
  bool likeValue;
  DiscountCard(
      {required this.img,
      required this.foodTitle,
      required this.distance,
      required this.ratings,
      required this.foodPrice,
      required this.deliveryCharges,
      required this.likeValue,
      super.key});

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(32), boxShadow: [
        BoxShadow(
          color: AppColor.greyColor.withOpacity(0.01),
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(50, 50),
        ),
      ]),
      margin: const EdgeInsets.only(
          left: Dimensions.dimen10,
          top: Dimensions.dimen5,
          bottom: Dimensions.dimen15,),

      width: Dimensions.dimen200,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(left: Dimensions.dimen10,right: Dimensions.dimen10,top: Dimensions.dimen10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Card(
                    color: AppColor.greyColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16), // Adjust the radius as needed
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(
                        widget.img,
                        width: Dimensions.dimen180,
                        height: Dimensions.dimen120,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.greenColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.only(
                          top: Dimensions.dimen5,
                          bottom: Dimensions.dimen5,
                          left: Dimensions.dimen8,
                          right: Dimensions.dimen8),
                      child: const TextWidget(
                          title: "PROMO",
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          titleColor: AppColor.whiteColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
               TextWidget(
                title: widget.foodTitle,
                maxLine: 1,
                fontWeight: FontWeight.bold,
                textoverflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
               IntrinsicHeight(
                child: Row(
                  children: [
                    TextWidget(
                    title: widget.distance,
                      maxLine: 1,
                      textoverflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      titleColor: AppColor.greyColor,
                    ),
                    const VerticalDivider(
                      color: AppColor.greyColor,
                      thickness: 1,
                      indent: 3,
                      endIndent: 3,
                    ),
                    const Icon(
                      Icons.star,
                      color: AppColor.lemonYellow,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextWidget(
                      title:widget.ratings,
                      maxLine: 1,
                      fontSize: 13,
                      titleColor: AppColor.greyColor,
                      textoverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
               IntrinsicHeight(
                child: Row(
                  children: [
                    TextWidget(
                      title:widget.foodPrice,
                      maxLine: 1,
                      titleColor: AppColor.greenColor,
                      textoverflow: TextOverflow.ellipsis,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    const VerticalDivider(
                      color: AppColor.greyColor,
                      thickness: 1,
                      indent: 6,
                      endIndent: 6,
                    ),
                    const Icon(
                      Icons.delivery_dining,
                      color: AppColor.greenColor,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                     TextWidget(
                      title: widget.deliveryCharges,
                      maxLine: 1,  fontSize: 13,
                      titleColor: AppColor.greyColor,
                      textoverflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Icon(
                      widget.likeValue
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: widget.likeValue
                          ? AppColor.redColor
                          : Colors.grey, // Use your desired grey color
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
