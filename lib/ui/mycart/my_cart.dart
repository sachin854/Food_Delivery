import 'package:finalapppp/resources/constants/dimensions.dart';
import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:finalapppp/resources/constants/padding.dart';
import 'package:flutter/material.dart';

import '../../resources/constants/color.dart';
import '../../widgets/component/text_widget.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "My Cart",
          style: TextStyle(color: AppColor.blackColor),
        ),
        backgroundColor: AppColor.primaryColor,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.pending_outlined,
              color: AppColor.blackColor,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: Paddings.padding16,
            right: Paddings.padding16,
            top: Paddings.padding30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: AppColor.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                padding: EdgeInsets.all(Paddings.padding8),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: AppColor.whiteColor, width: 1.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Expanded(
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: "Mixed Salad Bowl",
                          titleColor: AppColor.blackColor,
                          fontSize: AppFontWeight.font18,
                          fontWeight: FontWeight.w700,
                          //height: 4,
                          textoverflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            TextWidget(
                              title: "3 items",
                              titleColor: AppColor.greyColor,
                              fontSize: AppFontWeight.font12,
                              fontWeight: FontWeight.w700,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: Paddings.padding5,
                                right: Paddings.padding5),
                              child: TextWidget(
                                title: "|",
                                titleColor: AppColor.greyColor,
                                fontSize: AppFontWeight.font12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextWidget(
                              title: "1.5 kms",
                              titleColor: AppColor.greyColor,
                              fontSize: AppFontWeight.font12,
                              fontWeight: FontWeight.w700,
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        TextWidget(
                          title: "\$18.00",
                          titleColor: AppColor.greenColor,
                          fontSize: AppFontWeight.font12,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                  ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
