import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/assets/images.dart';
import '../resources/constants/color.dart';
import '../resources/constants/dimensions.dart';

class OfferCard extends StatefulWidget {
  final Color? color;
  final Widget? widget;
  const OfferCard({super.key, this.color,this.widget});

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: Dimensions.dimen20,right: Dimensions.dimen5,bottom: Dimensions.dimen10),
      decoration: BoxDecoration(
        color: AppColor.greenColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColor.greenColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(1, 2),
          ),
        ]
      ),
      child: Row(
        children: [
           Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.widget ?? const SizedBox(),
            ],
          ),
          const Spacer(),

          Container(
            padding: const EdgeInsets.only(top: Dimensions.dimen27,),
            height: Dimensions.dimen160,
            width: Dimensions.dimen130,
            child: Image.asset(Images.burger,)
          ),

        ],
      ),
    );
  }
}
