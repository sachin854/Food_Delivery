import 'package:flutter/material.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../widgets/component/text_widget.dart';

class PaymentCard extends StatefulWidget {
  final Icon icons;
  final String paymentTitle;
  final String price;
  final bool isSelected;
  final Function(bool?)? onChanged;
  PaymentCard(
      {required this.icons,
        required this.paymentTitle,
        required this.price,
        required this.isSelected,
        this.onChanged,});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
            TextWidget(
              title: widget.paymentTitle,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            widget.isSelected?
            TextWidget(
              title: widget.price,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ):const SizedBox.shrink(),
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
