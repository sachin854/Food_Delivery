import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/notification/notification_bloc.dart';
import '../../controller/bloc/notification/notification_state.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
class NotificationScreen extends StatefulWidget {
  static const routeName = "/notification";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        leading: BackButton(
          onPressed: () {},
          color: AppColor.blackColor,
        ),
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
          child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
            if (state is NotificationLoadingState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: state.notificationdata.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Row(
                            children: [
                              state.notificationdata[index]["avatar"],
                              const SizedBox(
                                width: Dimensions.dimen20,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.notificationdata[index]
                                              ["title"],
                                          style: const TextStyle(
                                              fontSize: AppFontWeight.font16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.blackColor),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: Paddings.padding5),
                                          child: Row(
                                            children: [
                                              Text(
                                                state.notificationdata[index]
                                                    ["date"],
                                                style: const TextStyle(
                                                    fontSize:
                                                        AppFontWeight.font12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColor.greyColor),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: Paddings.padding5,
                                                    right: Paddings.padding5),
                                                child: Text(
                                                  " | ",
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppFontWeight.font12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColor.greyColor),
                                                ),
                                              ),
                                              Text(
                                                state.notificationdata[index]
                                                    ["time"],
                                                style: const TextStyle(
                                                    fontSize:
                                                        AppFontWeight.font12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColor.greyColor),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    state.notificationdata[index]
                                                ["buttonshow"] ==
                                            true
                                        ? Container(
                                            height: Dimensions.dimen30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            width: 53,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColor.greenColor),
                                                onPressed: () {},
                                                child: const Text(
                                                  "New",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          AppFontWeight.font10,
                                                      color: Colors.white),
                                                )))
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: Dimensions.dimen15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                state.notificationdata[index]["description"],
                                style: const TextStyle(
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppFontWeight.font14),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                    color: AppColor.blackColor),
              );
            }
          }),
        ),
      ),
    ));
  }
}
