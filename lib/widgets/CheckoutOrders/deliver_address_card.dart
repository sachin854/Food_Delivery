import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
import '../component/text_widget.dart';
class DeliverAddressCard extends StatefulWidget {
  final String? title;
  final String? address;
   bool? defaultButton;
  Widget? widget;
  String? type;
  DeliverAddressCard({this.address,this.title,this.widget,this.defaultButton,this.type});

  @override
  State<DeliverAddressCard> createState() => _DeliverAddressCardState();
}

class _DeliverAddressCardState extends State<DeliverAddressCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Paddings.padding10,bottom: Paddings.padding5),
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColor.greyColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(1, 2),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
                backgroundColor: AppColor.greenColor.withOpacity(0.2),
                radius: 25,
                child: CircleAvatar(
                  backgroundColor: AppColor.greenColor,
                  radius: 18,
                  child: const Icon(
                    Icons.location_on_rounded,
                    color: AppColor.whiteColor,
                    size: 20,
                  ),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                    title: widget.title!,
                    titleColor: AppColor.blackColor,
                    fontSize: AppFontWeight.font15,
                    fontWeight: FontWeight.w700,
                  ),
                  widget.defaultButton==true ?
                 Container(
                      margin: EdgeInsets.only(left: Paddings.padding5),
                      height: Dimensions.dimen15,
                      decoration: BoxDecoration(
                          color: AppColor.greenColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5)),
                      width: 40,
                      child: Center(
                          child: TextWidget(
                            title: "Default",
                            fontSize: AppFontWeight.font8,
                            titleColor: AppColor.greenColor,
                          ))):
                      SizedBox()
                ],
              ),
              SizedBox(height: 5,),
              TextWidget(
                textoverflow: TextOverflow.ellipsis,
                title: widget.address!,
                titleColor: AppColor.greyColor,
                fontSize: AppFontWeight.font13,
                fontWeight: FontWeight.w500,
              ),

            ],
          ),
          Spacer(),
          widget.widget!
        ],
      ),
    );
  }
}
