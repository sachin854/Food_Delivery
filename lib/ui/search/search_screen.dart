import 'package:finalapppp/controller/bloc/search/search_bloc.dart';
import 'package:finalapppp/controller/bloc/search/search_event.dart';
import 'package:finalapppp/controller/bloc/search/search_state.dart';
import 'package:finalapppp/resources/constants/color.dart';
import 'package:finalapppp/resources/constants/dimensions.dart';
import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:finalapppp/resources/constants/padding.dart';
import 'package:finalapppp/ui/search/filters_screen.dart';
import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/assets/images.dart';

class SearchScreen extends StatefulWidget {
  static const routeName="/search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchBloc _searchBloc;
  int _selectedButtonIndex = 0;
  List<bool> isFavoriteList = List.generate(6, (index) => false);
  bool _isFocused = false;
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
  TextEditingController _searchController = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    _searchController = TextEditingController();
    _searchController.addListener(() {
      onChange();
    });
  }

  onChange() async {
    String textVal = _searchController.text.toString();
    print("textVal "+textVal.toString());
    _searchBloc.add(SearchTextChangedEvent(textVal));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.transparentColor,
      body: Container(
        margin: const EdgeInsets.only(
            right: Paddings.padding16, top: Paddings.padding20),
        child: SingleChildScrollView(
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state is SearchLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColor.greenColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppColor.greenColor)),
                          child: TextFormField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColor.greenColor,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.close,
                                    color: AppColor.blackColor,
                                  ),
                                  hintStyle:
                                      TextStyle(color: AppColor.blackColor),
                                  hintText: "Search",
                                  focusColor: AppColor.greenColor)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.dimen20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: Paddings.padding16, right: Paddings.padding16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          title: 'Recent Searches',
                          fontSize: AppFontWeight.font17,
                          fontWeight: FontWeight.bold,
                          titleColor: AppColor.blackColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              for (var index = 0;
                                  index < state.recentSearchData!.length;
                                  index++)
                                Container(
                                  margin: EdgeInsets.all(5),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: TextWidget(
                                        title: state.recentSearchData![index],
                                        titleColor: Colors.green,
                                        fontSize: AppFontWeight.font13,
                                        fontWeight: FontWeight.w700,
                                        textoverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextWidget(
                          title: 'Popular Cuisines',
                          fontSize: AppFontWeight.font17,
                          fontWeight: FontWeight.bold,
                          titleColor: AppColor.blackColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              for (var index = 0;
                              index < state.popularCuisineData!.length;
                              index++)
                                Container(
                                  margin: EdgeInsets.all(5),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: TextWidget(
                                        title: state.popularCuisineData![index],
                                        titleColor: Colors.green,
                                        fontSize: AppFontWeight.font13,
                                        fontWeight: FontWeight.w700,
                                        textoverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextWidget(
                          title: 'All Cuisines',
                          fontSize: AppFontWeight.font17,
                          fontWeight: FontWeight.bold,
                          titleColor: AppColor.blackColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: /*itemcount<1 ?? 0 :*/ 100,
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              for (var index = 0;
                              index < state.allCuisineData!.length;
                              index++)
                                Container(
                                  margin: EdgeInsets.all(5),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: TextWidget(
                                        title: state.allCuisineData![index],
                                        titleColor: Colors.green,
                                        fontSize: AppFontWeight.font13,
                                        fontWeight: FontWeight.w700,
                                        textoverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            if(state is SearchTextChangedState){
              print("stateeee");
              print(state.result);
              return Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColor.greenColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppColor.greenColor)),
                          child: TextFormField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColor.greenColor,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.close,
                                    color: AppColor.blackColor,
                                  ),
                                  hintStyle:
                                  TextStyle(color: AppColor.blackColor),
                                  hintText: "Search",
                                  focusColor: AppColor.greenColor)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.filterData.length,
                        itemBuilder: (context, index) {
                          bool isFocused = _selectedButtonIndex == index;
                          bool isSortButton = state.filterData[index]
                          ["food_filter"] ==
                              "Sort";
                          bool isFilterButton = state
                              .filterData[index]["food_filter"] ==
                              "Filter";
                          return InkWell(
                            onTap: (){

                            },
                            child: Container(
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
                                    Navigator.pushNamed(context, ApplyFiltersScreen.routeName);
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
                                        const EdgeInsets.only(left: 0),
                                        child: TextWidget(
                                          title: state.filterData[index]
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
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.searchData.length,
                      itemBuilder: (context, index) {

                        return Card(
                          margin: EdgeInsets.only(
                              top: 20, left: 16),
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
                                        child:Container(
                                          height: 100,
                                          width: 110,
                                          margin: EdgeInsets.only(
                                              left: (9.0),
                                              right: 8,
                                              top: 8,
                                              bottom: 8),
                                          padding: const EdgeInsets.only(
                                              left: Paddings.padding2,
                                            ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(14),
                                            border: Border.all(
                                                color: AppColor.whiteColor,
                                                width: 3),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            child: Image.network(
                                              state.searchData[index]
                                              ?["img"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 22,
                                        left: 25,
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
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          title:
                                          state.searchData[index]
                                          ["restaurant"],
                                          titleColor: AppColor.blackColor,
                                          fontSize: AppFontWeight.font18,
                                          fontWeight: FontWeight.w700,
                                          //height: 4,
                                          textoverflow:
                                          TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            TextWidget(
                                              title: state.searchData[
                                              index]["kms"],
                                              titleColor:
                                              AppColor.greyColor,
                                              fontSize:
                                              AppFontWeight.font12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            Padding(
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
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 15),
                                                TextWidget(
                                                  title: state
                                                      .searchData[
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
                                        SizedBox(
                                          height: 15,
                                        ),

                                        Row(
                                          children: [
                                            Icon(Icons.delivery_dining,
                                                color: Colors.green,
                                                size: 15),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 10),
                                              child: TextWidget(
                                                title: state
                                                    .searchData[
                                                index]["food_price"],
                                                titleColor:
                                                AppColor.greyColor,
                                                fontSize:
                                                AppFontWeight.font12,
                                                fontWeight:
                                                FontWeight.w700,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  right: 12),
                                              child: GestureDetector(
                                                onTap: () {
                                                  toggleFavorite(index);
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
                              Divider(thickness: 1,indent: 15,endIndent: 10,),
                              for(int i=0;i<state.searchData[index]?["items"].length;i++)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Container(
                                  height: 80,
                                  width: 90,
                                  margin: EdgeInsets.only(
                                      left: (9.0),
                                      right: 8,
                                      top: 4,
                                      bottom: 8),
                                  padding: const EdgeInsets.only(
                                      left: Paddings.padding2,
                                      right: Paddings.padding8),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(14),
                                    border: Border.all(
                                        color: AppColor.whiteColor,
                                        width: 3),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    child: Image.network(
                                      state.searchData[index]?["items"]?[i]?["img"] ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                  TextWidget(
                                    title: state
                                        .searchData[
                                    index]["items"][i]["title"],
                                    titleColor:
                                    AppColor.blackColor,
                                    fontSize:
                                    AppFontWeight.font14,
                                    fontWeight:
                                    FontWeight.w700,
                                  ),
                                  SizedBox(height: 15,),
                                  TextWidget(
                                    title: state
                                        .searchData[
                                    index]["items"][i]["price"],
                                    titleColor:
                                    AppColor.greenColor,
                                    fontSize:
                                    AppFontWeight.font12,
                                    fontWeight:
                                    FontWeight.w700,
                                  ),
                                    SizedBox(height: 10,),
                                ],),
                              ],)

                            ],
                          ),
                        );

                      },
                    ),
                  ),


                ],
              );
            }

            return SizedBox();
          }),
        ),
      ),
    ));
  }
}
