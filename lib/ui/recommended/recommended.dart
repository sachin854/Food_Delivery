import 'package:finalapppp/controller/bloc/recommended/recommend_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/recommended/recommed_bloc.dart';
import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
import '../../widgets/component/text_widget.dart';
import '../home_screen/addbasket/homeitem_screen.dart';
import '../home_screen/home_page.dart';
import 'filter.dart';

class RecommendedScreen extends StatefulWidget {
  static const routeName = "/Recommended";
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  State<RecommendedScreen> createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
  bool _isFocused = false;
  List<bool> isFavoriteList = List.generate(6, (index) => false);
  late RecommendedBloc _recommendedBloc;
  int _selectedButtonIndex = 0;

  void toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
    });
  }

  void _handleTap() {
    setState(() {
      _isFocused = true;
    });
  }

  @override
  void initState() {
    _recommendedBloc = BlocProvider.of<RecommendedBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          elevation: 0,
          title: const Text(
            'Recommended For You 😍',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.blackColor),
          ),
          backgroundColor: AppColor.primaryColor,
          leading:  BackButton(
            onPressed: (){
              Navigator.pushNamed(context, HomePage.routeName);
            },
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<RecommendedBloc, RecommendedState>(
                listener: (context, state) {
                  final Map<Type, String> stateToRouteMap = {
                    RecommendedFilterState: FilterScreen.routeName,
                  };
                  final routeName = stateToRouteMap[state.runtimeType];
                  if (routeName != null) {
                    Navigator.of(context).pushNamed(routeName);
                  }
                },
                builder: (context, state) {
                  if (state is RecommendedLoadingState) {
                    return Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.recommenddata.length,
                              itemBuilder: (context, index) {
                                bool isFocused =
                                    _selectedButtonIndex == index;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: isFocused
                                        ? Colors.green
                                        : Colors.grey.withOpacity(0.1),
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius:
                                        BorderRadius.circular(35),
                                  ),
                                  margin: const EdgeInsets.only(left: 16),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectedButtonIndex = index;
                                        });
                                        _handleTap;
                                        // _recommendedBloc.add(
                                        //     RecomendFilterEvent(_selectedButtonIndex));
                                        Navigator.pushNamed(context,
                                            FilterScreen.routeName);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: isFocused
                                              ? Colors.green
                                              : Colors.white,
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      25))),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Images.burger,
                                            height: 30,
                                            width: 15,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(
                                                    left: 5),
                                            child: TextWidget(
                                              title: state.recommenddata[
                                                          index]
                                                          ["food_filter"]
                                                      .toString() ??
                                                  "",
                                              titleColor: isFocused
                                                  ? Colors.white
                                                  : Colors.green,
                                              fontSize:
                                                  AppFontWeight.font13,
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
                            itemCount: state.recommenddata.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, HomeItemScreen.routeName);
                                },
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 16, right: 16),
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
                                                  BorderRadius.circular(
                                                      20),
                                              border: Border.all(
                                                  color:
                                                      AppColor.whiteColor,
                                                  width: 1.5),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20),
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
                                                  CrossAxisAlignment
                                                      .start,
                                              children: [
                                                TextWidget(
                                                  title: state.recommenddata[
                                                              index][
                                                          "food_title"] ??
                                                      "",
                                                  titleColor:
                                                      AppColor.blackColor,
                                                  fontSize: AppFontWeight
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
                                                Row(
                                                  children: [
                                                    TextWidget(
                                                      title: state.recommenddata[
                                                                  index][
                                                              "distance"] ??
                                                          "",
                                                      titleColor: AppColor
                                                          .greyColor,
                                                      fontSize:
                                                          AppFontWeight
                                                              .font12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: Paddings
                                                              .padding5,
                                                          right: Paddings
                                                              .padding5),
                                                      child: TextWidget(
                                                        title: "|",
                                                        titleColor:
                                                            AppColor
                                                                .greyColor,
                                                        fontSize:
                                                            AppFontWeight
                                                                .font12,
                                                        fontWeight:
                                                            FontWeight
                                                                .w700,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.star,
                                                            color: Colors
                                                                .orange,
                                                            size: 15),
                                                        TextWidget(
                                                          title: state.recommenddata[
                                                                      index]
                                                                  [
                                                                  "rating"] ??
                                                              "",
                                                          titleColor:
                                                              AppColor
                                                                  .greyColor,
                                                          fontSize:
                                                              AppFontWeight
                                                                  .font12,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w700,
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
                                                    const Icon(
                                                        Icons
                                                            .delivery_dining,
                                                        color:
                                                            Colors.green,
                                                        size: 15),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                                  .only(
                                                              left: 10),
                                                      child: TextWidget(
                                                        title: state.recommenddata[
                                                                    index]
                                                                [
                                                                "food_price"] ??
                                                            "",
                                                        titleColor:
                                                            AppColor
                                                                .greyColor,
                                                        fontSize:
                                                            AppFontWeight
                                                                .font12,
                                                        fontWeight:
                                                            FontWeight
                                                                .w700,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                                  .only(
                                                              right: 12),
                                                      child:
                                                          GestureDetector(
                                                        onTap: () {
                                                          toggleFavorite(
                                                              index);
                                                        },
                                                        child: Icon(
                                                          isFavoriteList[
                                                                  index]
                                                              ? Icons
                                                                  .favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color: isFavoriteList[
                                                                  index]
                                                              ? Colors.red
                                                              : Colors
                                                                  .red,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
