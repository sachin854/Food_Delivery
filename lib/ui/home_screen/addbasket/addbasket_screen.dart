import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/bloc/home_item/tapitem_bloc.dart';
import '../../../controller/bloc/home_item/tapitem_state.dart';
import '../../../resources/assets/images.dart';
import '../../../resources/constants/color.dart';
import '../../../resources/constants/dimensions.dart';
import '../../../resources/constants/font_weight.dart';
import '../../../resources/constants/padding.dart';

class HomeItemScreen extends StatefulWidget {
  static const routeName = "/addbasket";
  const HomeItemScreen({Key? key}) : super(key: key);

  @override
  State<HomeItemScreen> createState() => _HomeItemScreenState();
}

class _HomeItemScreenState extends State<HomeItemScreen> {
  int _selectedCardIndex = -1;
  int _selectedMenuIndex = -1;
  int _selectedDrinkIndex = -1;
  List<bool> isFavoriteList = List.generate(6, (index) => false);

  void toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://cdn.britannica.com/98/235798-050-3C3BA15D/Hamburger-and-french-fries-paper-box.jpg',
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 10,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                    top: 20,
                    right: 60,
                    child: GestureDetector(
                        onTap: () {
                          // toggleFavorite();
                        },
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: GestureDetector(
                        onTap: () {
                          // toggleFavorite();
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          title: "Big garden Salad",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          child: TextWidget(
                            title: "4.8",
                            titleColor: AppColor.blackColor,
                            fontSize: AppFontWeight.font17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextWidget(
                          title: "(4.8k reviews)",
                          titleColor: AppColor.greyColor,
                          fontSize: AppFontWeight.font15,
                          fontWeight: FontWeight.w700,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(Icons.local_pizza, color: Colors.green, size: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextWidget(
                            title: "2.4 km",
                            titleColor: AppColor.blackColor,
                            fontSize: AppFontWeight.font17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 7),
                      child: Row(
                        children: [
                          TextWidget(
                            title: "Delivery Now",
                            titleColor: AppColor.greyColor,
                            fontSize: AppFontWeight.font15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextWidget(
                              title: "|",
                              titleColor: AppColor.greyColor,
                              fontSize: AppFontWeight.font12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.delivery_dining,
                              color: Colors.green, size: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextWidget(
                              title: "\$8.00",
                              titleColor: AppColor.greyColor,
                              fontSize: AppFontWeight.font12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.local_offer, color: Colors.green, size: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: TextWidget(
                            title: "Offers are available",
                            titleColor: AppColor.blackColor,
                            fontSize: AppFontWeight.font17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: TextWidget(
                        title: "For You",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SingleChildScrollView(
                      child: BlocBuilder<ItemTapBloc, ItemTapState>(
                        builder: (context, state) {
                          if(state is ItemTapLoadingtate){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.dimen300,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    itemCount: state.homeitemdata.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      bool isCardTapped = _selectedCardIndex == index;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedCardIndex = index;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(32),
                                              border: Border.all(
                                                  width: 2,
                                                  color: isCardTapped
                                                      ? Colors.green.withOpacity(0.7)
                                                      : Colors.white.withOpacity(0.1)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColor.greyColor
                                                      .withOpacity(0.01),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: const Offset(50, 50),
                                                ),
                                              ]),
                                          margin: const EdgeInsets.only(
                                              top: Dimensions.dimen5,
                                              bottom: Dimensions.dimen15,
                                              right: Dimensions.dimen10),
                                          width: Dimensions.dimen170,
                                          height: Dimensions.dimen70,
                                          child: Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            elevation: 10,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: Dimensions.dimen10,
                                                  right: Dimensions.dimen10,
                                                  top: Dimensions.dimen10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Card(
                                                        color: AppColor.greyColor,
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20), // Adjust the radius as needed
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                          child: Image.asset(
                                                            Images.burger,
                                                            width:
                                                            Dimensions.dimen150,
                                                            height:
                                                            Dimensions.dimen90,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 20,
                                                        left: 10,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color:
                                                            AppColor.greenColor,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                8),
                                                          ),
                                                          padding: const EdgeInsets
                                                              .only(
                                                              top: Dimensions.dimen5,
                                                              bottom:
                                                              Dimensions.dimen5,
                                                              left: Dimensions.dimen8,
                                                              right:
                                                              Dimensions.dimen8),
                                                          child: const TextWidget(
                                                              title: "Beset seller",
                                                              fontSize: 10,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              titleColor: AppColor
                                                                  .whiteColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextWidget(
                                                    title: state.homeitemdata[index]["your_title"],
                                                    titleColor: isCardTapped
                                                        ? AppColor.greenColor
                                                        : AppColor.blackColor,
                                                    maxLine: 2,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    textoverflow:
                                                    TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      children: [
                                                        TextWidget(
                                                          title: state.homeitemdata[index]
                                                          ["price"],
                                                          maxLine: 1,
                                                          titleColor:
                                                          AppColor.greenColor,
                                                          textoverflow:
                                                          TextOverflow.ellipsis,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 10),
                                  child: TextWidget(
                                    title: "Menu",
                                    titleColor: AppColor.blackColor,
                                    fontSize: AppFontWeight.font20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.homeitemdata.length,
                                    itemBuilder: (context, index) {
                                      bool isCardTapped = _selectedMenuIndex == index;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedMenuIndex = index;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: isCardTapped
                                                      ? Colors.green.withOpacity(0.7)
                                                      : Colors.grey.withOpacity(0.1)),
                                              borderRadius: BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                  AppColor.greyColor.withOpacity(0.01),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: const Offset(50, 50),
                                                ),
                                              ]),
                                          child: Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          Paddings.padding15),
                                                      height: 120,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(20),
                                                        border: Border.all(
                                                            color: AppColor.whiteColor,
                                                            width: 1.5),
                                                      ),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(20),
                                                          child: Image.network(
                                                            state.homeitemdata[index]
                                                            ["images"],
                                                            fit: BoxFit.cover,
                                                          )),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(bottom: 10),
                                                            decoration: BoxDecoration(
                                                              color: AppColor.greenColor,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                            ),
                                                            padding: const EdgeInsets.only(
                                                                top: Dimensions.dimen5,
                                                                bottom: Dimensions.dimen5,
                                                                left: Dimensions.dimen8,
                                                                right: Dimensions.dimen8),
                                                            child: const TextWidget(
                                                                title: "New",
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.bold,
                                                                titleColor:
                                                                AppColor.whiteColor),
                                                          ),
                                                          TextWidget(
                                                            title: state.homeitemdata[index]
                                                            ["menu_title"] ??
                                                                "",
                                                            titleColor: isCardTapped
                                                                ? AppColor.greenColor
                                                                : AppColor.blackColor,
                                                            fontSize: AppFontWeight.font18,
                                                            fontWeight: FontWeight.w700,
                                                            //height: 4,
                                                            textoverflow:
                                                            TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextWidget(
                                                            title: state.homeitemdata[index]
                                                            ["price"] ??
                                                                "",
                                                            maxLine: 1,
                                                            titleColor: AppColor.greenColor,
                                                            textoverflow:
                                                            TextOverflow.ellipsis,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                                  child: TextWidget(
                                    title: "Drink",
                                    titleColor: AppColor.blackColor,
                                    fontSize: AppFontWeight.font20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.homeitemdata.length,
                                    itemBuilder: (context, index) {
                                      bool isCardTapped = _selectedDrinkIndex == index;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedDrinkIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: isCardTapped
                                                      ? Colors.green.withOpacity(0.7)
                                                      : Colors.grey.withOpacity(0.1)),
                                              borderRadius: BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                  AppColor.greyColor.withOpacity(0.01),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: const Offset(50, 50),
                                                ),
                                              ]),
                                          child: Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          Paddings.padding15),
                                                      height: 120,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(20),
                                                        border: Border.all(
                                                            color: AppColor.whiteColor,
                                                            width: 1.5),
                                                      ),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(20),
                                                          child: Image.network(
                                                            "https://images.absolutdrinks.com/drink-images/Raw/Absolut/72e8f521-50cf-45bf-80ec-1abf3baec30a.jpg?imwidth=500",
                                                            fit: BoxFit.cover,
                                                          )),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(bottom: 10),
                                                            decoration: BoxDecoration(
                                                              color: AppColor.greenColor,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                            ),
                                                            padding: const EdgeInsets.only(
                                                                top: Dimensions.dimen5,
                                                                bottom: Dimensions.dimen5,
                                                                left: Dimensions.dimen8,
                                                                right: Dimensions.dimen8),
                                                            child: const TextWidget(
                                                                title: "Promo",
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.bold,
                                                                titleColor:
                                                                AppColor.whiteColor),
                                                          ),
                                                          TextWidget(
                                                            title: state.homeitemdata[index]
                                                            ["drink_title"] ??
                                                                "",
                                                            titleColor: isCardTapped
                                                                ? AppColor.greenColor
                                                                : AppColor.blackColor,
                                                            fontSize: AppFontWeight.font18,
                                                            fontWeight: FontWeight.w700,
                                                            //height: 4,
                                                            textoverflow:
                                                            TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextWidget(
                                                            title: state.homeitemdata[index]
                                                            ["price"] ??
                                                                "",
                                                            maxLine: 1,
                                                            titleColor: AppColor.greenColor,
                                                            textoverflow:
                                                            TextOverflow.ellipsis,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );

                          }
                          else{
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25), // Adjust the radius as needed
                            ),
                          ),
                          onPressed: () => {},
                          child: Text(
                            'Basket . 3 items . \$24.00',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
