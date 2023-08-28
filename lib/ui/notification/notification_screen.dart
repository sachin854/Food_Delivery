import 'package:finalapppp/controller/bloc/notification/notification_bloc.dart';
import 'package:finalapppp/controller/bloc/notification/notification_state.dart';
import 'package:finalapppp/resources/constants/color.dart';
import 'package:finalapppp/resources/constants/dimensions.dart';
import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:finalapppp/resources/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.transparentColor,
      appBar: AppBar(
        backgroundColor: AppColor.transparentColor,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.blackColor,
            )),
        title: const Text(
          "Notification",
          style: TextStyle(color: AppColor.blackColor),
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
        margin: const EdgeInsets.only(
            left: Paddings.padding16,
            right: Paddings.padding16,
            top: Paddings.padding20),
        child: SingleChildScrollView(
          child: BlocBuilder<NotificationBloc,NotificationState>(
            builder: (context,state) {
              if(state is NotificationLoadingState) {
                return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount:state.notificationdata.length,
                    itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: AppColor.redColor.withOpacity(0.1),
                              radius: 23,
                              child: Container(
                                height: Dimensions.dimen20,
                                width: Dimensions.dimen20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColor.redColor.withOpacity(0.7)),
                                child: const Icon(
                                  Icons.close,
                                  color: AppColor.whiteColor,
                                  size: 15,
                                ),
                              )),
                          SizedBox(
                            width: Dimensions.dimen20,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                     state.notificationdata[index]["title"],
                                      style: TextStyle(
                                          fontSize: AppFontWeight.font16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.blackColor),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: Paddings.padding5),
                                      child: Row(
                                        children: [
                                          Text(
                                            state.notificationdata[index]["date"],
                                            style: TextStyle(
                                                fontSize: AppFontWeight.font12,
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.greyColor),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: Paddings.padding5,
                                                right: Paddings.padding5),
                                            child: Text(
                                              " | ",
                                              style: TextStyle(
                                                  fontSize: AppFontWeight.font12,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColor.greyColor),
                                            ),
                                          ),
                                          Text(
                                              state.notificationdata[index]["time"],
                                            style: TextStyle(
                                                fontSize: AppFontWeight.font12,
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.greyColor),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                state.notificationdata[index]["buttonshow"]==true?
                                Container(
                                    height: Dimensions.dimen30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14)),
                                    width: 53,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.greenColor),
                                        onPressed: () {},
                                        child: const Text(
                                          "New",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: AppFontWeight.font10,
                                              color: Colors.white),
                                        ))):SizedBox()
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.dimen15,
                      ),
                       Row(
                        children: [
                          Expanded(
                              child: Text(
                                state.notificationdata[index]["description"],
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: AppFontWeight.font14),
                          ))
                        ],
                      ),
                      SizedBox(height: 30,)
                    ],
                  );
                }),
              );
              } else
                {
                  return SizedBox();
                }

            }
          ),
        ),
      ),
    ));
  }
}
