import 'package:flutter/material.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../widgets/component/text_widget.dart';

class DiscountCardItem extends StatefulWidget {
  final Icon icons;
  final String discountTitle;
  final String discountDetails;
  final bool isSelected;
  final Function(bool?)? onChanged;
  DiscountCardItem(
      {required this.icons,
        required this.discountTitle,
        required this.discountDetails,
        required this.isSelected,
        this.onChanged,});

  @override
  State<DiscountCardItem> createState() => _DiscountCardItemState();
}

class _DiscountCardItemState extends State<DiscountCardItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(top: Dimensions.dimen15,bottom: Dimensions.dimen15),
      height: Dimensions.dimen70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.dimen16)),
        color: AppColor.whiteColor,
      ),
      margin: const EdgeInsets.only(
          top: Dimensions.dimen10,
          bottom: Dimensions.dimen10,
          left: Dimensions.dimen16,
          right: Dimensions.dimen16),
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.dimen20, right: Dimensions.dimen20),
        child: Row(
          children: [
            widget.icons,
            const SizedBox(
              width: Dimensions.dimen10,
            ),
            Column(
              children: [
                TextWidget(
                  title: widget.discountTitle,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  title: widget.discountDetails,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),

              ],
            ),
         const Spacer(),
            Radio(
              fillColor: MaterialStateProperty.all(AppColor.greenColor),
              value: true,
              groupValue: widget.isSelected,
              onChanged: widget.onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
