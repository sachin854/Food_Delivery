import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/item_filter/filter_bloc.dart';
import '../../controller/bloc/item_filter/filter_state.dart';
import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
import '../../widgets/component/text_widget.dart';
import '../more_category/more_category.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";

   const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int _selectedButtonIndex = 0;
  List<bool> isFavoriteList = List.generate(6, (index) => false);

  // void toggleFavorite(int index) {
  //   setState(() {
  //     isFavoriteList[index] = !isFavoriteList[index];
  //   });
  // }

  // void _handleTap() {
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MoreCategory.routeName);
                },
                icon: const Icon(Icons.arrow_back)),
            const TextWidget(
              title: 'Hamburger',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SingleChildScrollView(
              child: BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoadingState) {
                    return Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.Filteritemdata.length,
                              itemBuilder: (context, index) {
                                bool isFocused = _selectedButtonIndex == index;
                                bool isSortButton = state.Filteritemdata[index]
                                        ["food_filter"] ==
                                    "Sort";
                                bool isFilterButton = state
                                        .Filteritemdata[index]["food_filter"] ==
                                    "Filter";
                                return Container(
                                  decoration: BoxDecoration(
                                    color: isFocused
                                        ? Colors.green
                                        : Colors.grey.withOpacity(0.1),
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  margin: EdgeInsets.only(left: 16),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectedButtonIndex = index;
                                        });
                                        _handleTap;
                                      },
                                      style: ElevatedButton.styleFrom(
                                          alignment: Alignment.center,
                                          backgroundColor: isFocused
                                              ? Colors.green
                                              : Colors.white,
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      child: Row(
                                        children: [
                                          if (isSortButton)
                                            Icon(
                                              Icons.sort,
                                              size: 20,
                                              color: isFocused
                                                  ? Colors.white
                                                  : Colors.green,
                                            ),
                                          if (isFilterButton)
                                            Icon(
                                              Icons.filter_list,
                                              size: 20,
                                              color: isFocused
                                                  ? Colors.white
                                                  : Colors.green,
                                            ),
                                          if (!isSortButton && !isFilterButton)
                                            SizedBox(width: 20),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: TextWidget(
                                              title: state.Filteritemdata[index]
                                                  ["food_filter"],
                                              titleColor: isFocused
                                                  ? Colors.white
                                                  : Colors.green,
                                              fontSize: AppFontWeight.font13,
                                              fontWeight: FontWeight.w700,
                                              textoverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              }),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.Filteritemdata.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.only(
                                    top: 20, left: 16, right: 16),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Card(
                                              color: AppColor.whiteColor,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    20), // Adjust the radius as needed
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Image.asset(
                                                  Images.burger,
                                                  width: Dimensions.dimen100,
                                                  height: Dimensions.dimen90,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 20,
                                              child: Container(
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
                                            ),
                                          ],
                                        ),
                                      if (isFilterButton)
                                        Icon(
                                          Icons.filter_list,
                                          size: 20,
                                          color: isFocused
                                              ? Colors.white
                                              : Colors.green,
                                        ),
                                      if (!isSortButton && !isFilterButton)
                                        const SizedBox(width: 20),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5),
                                        child: TextWidget(
                                          title: state.categoryDataFilter[index]["food_filter"],
                                          titleColor: isFocused
                                              ? Colors.white
                                              : Colors.green,
                                          fontSize: AppFontWeight.font13,
                                          fontWeight: FontWeight.w700,
                                          textoverflow:
                                              TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.categoryDataFilter.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(
                                top: 20, left: 16, right: 16),
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
                                      padding: const EdgeInsets.all(
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
                                          child: Image.asset(
                                            Images.burger,
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
                                          TextWidget(
                                            title: state.categoryDataFilter[index]
                                                    ["food_title"],
                                            titleColor: AppColor.blackColor,
                                            fontSize: AppFontWeight.font18,
                                            fontWeight: FontWeight.w700,
                                            textoverflow:
                                                TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: Dimensions.dimen15,
                                          ),
                                          Row(
                                            children: [
                                              TextWidget(
                                                title: state.categoryDataFilter[
                                                    index]["distance"],
                                                titleColor:
                                                    AppColor.greyColor,
                                                fontSize:
                                                    AppFontWeight.font12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: Paddings.padding5,
                                                    right:
                                                        Paddings.padding5),
                                                child: TextWidget(
                                                  title: "|",
                                                  titleColor:
                                                      AppColor.greyColor,
                                                  fontSize:
                                                      AppFontWeight.font12,
                                                  fontWeight:
                                                      FontWeight.w700,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(Icons.star,
                                                      color: Colors.orange,
                                                      size: 15),
                                                  TextWidget(
                                                    title: state
                                                            .categoryDataFilter[
                                                        index]["rating"],
                                                    titleColor:
                                                        AppColor.greyColor,
                                                    fontSize: AppFontWeight
                                                        .font12,
                                                    fontWeight:
                                                        FontWeight.w700,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.delivery_dining,
                                                  color: Colors.green,
                                                  size: 15),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 10),
                                                child: TextWidget(
                                                  title: state
                                                          .categoryDataFilter[
                                                      index]["food_price"],
                                                  titleColor:
                                                      AppColor.greyColor,
                                                  fontSize:
                                                      AppFontWeight.font12,
                                                  fontWeight:
                                                      FontWeight.w700,
                                                ),
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        right: 12),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // toggleFavorite(index);
                                                  },
                                                  child: Icon(
                                                    isFavoriteList[index]
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_border,
                                                    color: isFavoriteList[
                                                            index]
                                                        ? Colors.red
                                                        : Colors.red,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }

            },
          ),
        ),
          ],
        ),
          ]
      )),
    );
    )
  }
}
