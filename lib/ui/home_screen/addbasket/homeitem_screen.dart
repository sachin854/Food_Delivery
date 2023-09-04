import 'package:finalapppp/controller/bloc/additem/additem_bloc.dart';
import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/bloc/home_item/tapitem_bloc.dart';
import '../../../controller/bloc/home_item/tapitem_state.dart';
import '../../../resources/constants/color.dart';
import '../../../resources/constants/dimensions.dart';
import '../../../resources/constants/font_weight.dart';
import '../../../resources/constants/padding.dart';
import 'add_item.dart';

class HomeItemScreen extends StatefulWidget {
  static const routeName = "/homeitem";
  int? index;
  HomeItemScreen({Key? key,required this.index}) : super(key: key);

  @override
  State<HomeItemScreen> createState() => _HomeItemScreenState();
}

class _HomeItemScreenState extends State<HomeItemScreen> {
  int _selectedCardIndex = -1;
  int _selectedMenuIndex = -1;
  int _selectedDrinkIndex = -1;

  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: BlocConsumer<ItemTapBloc, ItemTapState>(
          listener: (context, state) {
// if (state is ItemTapLoadingtate) {
// if (state.index != null) {
// if (state.homeitemdata[state.index!].isLiked!) {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text('Liked')),
// );
// } else {
// ScaffoldMessenger.of(context)
// .showSnackBar(SnackBar(
// content: Text('Unliked'),
// backgroundColor: Colors.amber,
// ));
// }
// }
// }
          },
          builder: (context, state) {
            if (state is ItemTapLoadingtate) {
              return BlocProvider(
                create: (context) => AddItemBloc(
                    state.homeitemdata[widget.index!].index),
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
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                        Positioned(
                          top: 20,
                          right: 60,
                          child: GestureDetector(
                              onTap: () {
// context.read<ItemTapBloc>().likeItem();
                              },
                              child: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              )),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: GestureDetector(
                              onTap: () {
// toggleFavorite(
// index);
                              },
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
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
                    const Divider(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.orange, size: 20),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 7, right: 7),
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
                    const Divider(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.local_pizza,
                            color: Colors.green, size: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
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
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 25, top: 7),
                      child: Row(
                        children: [
                          TextWidget(
                            title: "Delivery Now",
                            titleColor: AppColor.greyColor,
                            fontSize: AppFontWeight.font15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10),
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
                            padding:
                                EdgeInsets.only(left: 10),
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
                    const Divider(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.local_offer,
                            color: Colors.green, size: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 7),
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
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 30, bottom: 20),
                      child: TextWidget(
                        title: "For You",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.dimen300,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: state.homeitemdata.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final bestSellerIndices = [0, 2];
                          final isBestSeller =
                              bestSellerIndices.contains(index);
                          bool isCardTapped =
                              _selectedCardIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCardIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(32),
                                  border: Border.all(
                                      width: 2,
                                      color: isCardTapped
                                          ? Colors.green
                                              .withOpacity(0.7)
                                          : Colors.white
                                              .withOpacity(0.1)),
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
                                  borderRadius:
                                      BorderRadius.circular(30),
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
                                      GestureDetector(
                                        onTap: () {
                                          {
//context.read<ItemTapBloc>().add(MenuitemEvent(index));

                                            print('iteeemmm...' +
                                                index.toString());
                                            Map<String, dynamic>
                                                item = {
                                              "index": index
                                            };
                                            Navigator.pushNamed(
                                                context,
                                                AddItemScreen
                                                    .routeName,
                                                arguments: item);
                                          }
                                          ;
                                        },
                                        child: Stack(
                                          children: [
                                            Card(
                                              color: AppColor
                                                  .greyColor,
                                              elevation: 0,
                                              shape:
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                            20), // Adjust the radius as needed
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                              20),
                                                  child:
                                                      Image.network(
                                                    state.homeitemdata[
                                                            index]
                                                        ["images"],
                                                    fit: BoxFit
                                                        .cover,
                                                    height: Dimensions
                                                        .dimen120,
                                                    width: Dimensions
                                                        .dimen170,
                                                  )),
                                            ),
                                            if (isBestSeller)
                                              Positioned(
                                                top: 20,
                                                left: 10,
                                                child: Container(
                                                  decoration:
                                                      BoxDecoration(
                                                    color: AppColor
                                                        .greenColor,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                                8),
                                                  ),
                                                  padding: const EdgeInsets
                                                          .only(
                                                      top: Dimensions
                                                          .dimen5,
                                                      bottom:
                                                          Dimensions
                                                              .dimen5,
                                                      left: Dimensions
                                                          .dimen8,
                                                      right: Dimensions
                                                          .dimen8),
                                                  child: const TextWidget(
                                                      title:
                                                          "Beset seller",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight
                                                              .bold,
                                                      titleColor:
                                                          AppColor
                                                              .whiteColor),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        title: state
                                                .homeitemdata[index]
                                            ["your_title"],
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
                                              title: state
                                                  .homeitemdata[
                                                      index]
                                                      ["price"]
                                                  .toString(),
                                              maxLine: 1,
                                              titleColor: AppColor
                                                  .greenColor,
                                              textoverflow:
                                                  TextOverflow
                                                      .ellipsis,
                                              fontSize: 15,
                                              fontWeight:
                                                  FontWeight.bold,
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
                      height:
                          MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.homeitemdata.length,
                        itemBuilder: (context, index) {
                          final bestNewIndices = [0, 3];
                          final isNewSeller =
                              bestNewIndices.contains(index);
                          bool isCardTapped =
                              _selectedMenuIndex == index;
                          double price = state.homeitemdata[index]
                                  ["price"] as double? ??
                              0.0;
                          if (isCardTapped) {
                            totalPrice =
                                0.0; // Reset the total price
                            for (int i = 0;
                                i < state.homeitemdata.length;
                                i++) {
                              if (_selectedMenuIndex == i) {
                                totalPrice += state.homeitemdata[i]
                                        ["price"] as double? ??
                                    0.0;
                              }
                            }
                          }
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
                                          ? Colors.green
                                              .withOpacity(0.7)
                                          : Colors.grey
                                              .withOpacity(0.1)),
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.greyColor
                                          .withOpacity(0.01),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: const Offset(50, 50),
                                    ),
                                  ]),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(
                                              Paddings.padding15),
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius
                                                    .circular(20),
                                            border: Border.all(
                                                color: AppColor
                                                    .whiteColor,
                                                width: 1.5),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(20),
                                              child: Image.network(
                                                state.homeitemdata[
                                                        index]
                                                    ["images"],
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                            children: [
                                              if (isNewSeller)
                                                Container(
                                                  margin: const EdgeInsets
                                                      .only(
                                                          bottom:
                                                              10),
                                                  decoration:
                                                      BoxDecoration(
                                                    color: AppColor
                                                        .greenColor,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                                8),
                                                  ),
                                                  padding: const EdgeInsets
                                                          .only(
                                                      top: Dimensions
                                                          .dimen5,
                                                      bottom:
                                                          Dimensions
                                                              .dimen5,
                                                      left: Dimensions
                                                          .dimen8,
                                                      right: Dimensions
                                                          .dimen8),
                                                  child: const TextWidget(
                                                      title: "New",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight
                                                              .bold,
                                                      titleColor:
                                                          AppColor
                                                              .whiteColor),
                                                ),
                                              TextWidget(
                                                title: state.homeitemdata[
                                                            index][
                                                        "menu_title"] ??
                                                    "",
                                                titleColor: isCardTapped
                                                    ? AppColor
                                                        .greenColor
                                                    : AppColor
                                                        .blackColor,
                                                fontSize:
                                                    AppFontWeight
                                                        .font18,
                                                fontWeight:
                                                    FontWeight.w700,
//height: 4,
                                                textoverflow:
                                                    TextOverflow
                                                        .ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              TextWidget(
                                                title: state
                                                        .homeitemdata[
                                                            index][
                                                            "price"]
                                                        .toString() ??
                                                    "",
                                                maxLine: 1,
                                                titleColor: AppColor
                                                    .greenColor,
                                                textoverflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                fontSize: 15,
                                                fontWeight:
                                                    FontWeight.bold,
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
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10),
                      child: TextWidget(
                        title: "Drink",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.homeitemdata.length,
                        itemBuilder: (context, index) {
                          final bestPromoIndices = [0, 2];
                          final isPromoSeller =
                              bestPromoIndices.contains(index);
                          bool isCardTapped =
                              _selectedDrinkIndex == index;
                          double price = state.homeitemdata[index]
                                  ["price"] as double? ??
                              0.0;
                          if (isCardTapped) {
                            totalPrice =
                                0.0; // Reset the total price
                            for (int i = 0;
                                i < state.homeitemdata.length;
                                i++) {
                              if (_selectedDrinkIndex == i) {
                                totalPrice += state.homeitemdata[i]
                                        ["price"] as double? ??
                                    0.0;
                              }
                            }
                          }
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDrinkIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: isCardTapped
                                          ? Colors.green
                                              .withOpacity(0.7)
                                          : Colors.grey
                                              .withOpacity(0.1)),
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.greyColor
                                          .withOpacity(0.01),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: const Offset(50, 50),
                                    ),
                                  ]),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(
                                              Paddings.padding15),
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius
                                                    .circular(20),
                                            border: Border.all(
                                                color: AppColor
                                                    .whiteColor,
                                                width: 1.5),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(20),
                                              child: Image.network(
                                                "https://images.absolutdrinks.com/drink-images/Raw/Absolut/72e8f521-50cf-45bf-80ec-1abf3baec30a.jpg?imwidth=500",
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                            children: [
                                              if (isPromoSeller)
                                                Container(
                                                  margin: const EdgeInsets
                                                      .only(
                                                          bottom:
                                                              10),
                                                  decoration:
                                                      BoxDecoration(
                                                    color: AppColor
                                                        .greenColor,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                                8),
                                                  ),
                                                  padding: const EdgeInsets
                                                          .only(
                                                      top: Dimensions
                                                          .dimen5,
                                                      bottom:
                                                          Dimensions
                                                              .dimen5,
                                                      left: Dimensions
                                                          .dimen8,
                                                      right: Dimensions
                                                          .dimen8),
                                                  child: const TextWidget(
                                                      title:
                                                          "Promo",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight
                                                              .bold,
                                                      titleColor:
                                                          AppColor
                                                              .whiteColor),
                                                ),
                                              TextWidget(
                                                title: state.homeitemdata[
                                                            index][
                                                        "drink_title"] ??
                                                    "",
                                                titleColor: isCardTapped
                                                    ? AppColor
                                                        .greenColor
                                                    : AppColor
                                                        .blackColor,
                                                fontSize:
                                                    AppFontWeight
                                                        .font18,
                                                fontWeight:
                                                    FontWeight.w700,
//height: 4,
                                                textoverflow:
                                                    TextOverflow
                                                        .ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              TextWidget(
                                                title: state
                                                        .homeitemdata[
                                                            index][
                                                            "price"]
                                                        .toString() ??
                                                    "",
                                                maxLine: 1,
                                                titleColor: AppColor
                                                    .greenColor,
                                                textoverflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                fontSize: 15,
                                                fontWeight:
                                                    FontWeight.bold,
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
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 30),
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
                          child: Column(
                            children: [
                              TextWidget(
                                title:
                                    'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                                height: 2,
                                fontSize: 16,
                                titleColor: Colors.white,
                              ),

// 'Basket . 3 items . \$24.00',
                            ],
                          )),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        )),
      ),
    );
  }
}
