import 'package:finalapppp/controller/bloc/search/search_bloc.dart';
import 'package:finalapppp/controller/bloc/search/search_state.dart';
import 'package:finalapppp/resources/constants/color.dart';
import 'package:finalapppp/resources/constants/dimensions.dart';
import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:finalapppp/resources/constants/padding.dart';
import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  List popularCuisines = [
    'Breakfast',
    'Snack',
    'Fast Food',
    'Beverages',
    'Chicken',
    'Noodles',
    'Rice',
    'Seafood',
    'International',
  ];
  List allCuisines = ['Bakery & Cake', 'Dessert', 'Pizza'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.transparentColor,
      body: Container(
        margin: const EdgeInsets.only(
            right: Paddings.padding16, top: Paddings.padding20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColor.greenColor,
                              ),
                              suffixIcon: Icon(
                                Icons.close,
                                color: AppColor.blackColor,
                              ),
                              hintStyle: TextStyle(color: AppColor.blackColor),
                              hintText: "Search",
                              focusColor: AppColor.greenColor)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.dimen20,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: Paddings.padding16, right: Paddings.padding16),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: 'Recent Searches',
                      fontSize: AppFontWeight.font17,
                      fontWeight: FontWeight.bold,
                      titleColor: AppColor.blackColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                      BlocBuilder<SearchBloc,SearchState>(
                        builder: (context,state) {
                          print("abc");
                          print(state);
                          if(state is SearchRecentSearchState) {
                            print("object");
                            print(state);
                            return SizedBox(
                            height: /*itemcount<1 ?? 0 :*/ 100,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: state.recentSearchData.length,
                              itemBuilder: (context, index) {
                                return Container(
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
                                        title: state.recentSearchData[index],
                                        titleColor: Colors.green,
                                        fontSize: AppFontWeight.font13,
                                        fontWeight: FontWeight.w700,
                                        textoverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                          }
                          else
                            return SizedBox();

                        }
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      title: 'Popular Cuisines',
                      fontSize: AppFontWeight.font17,
                      fontWeight: FontWeight.bold,
                      titleColor: AppColor.blackColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: /*itemcount<1 ?? 0 :*/ 150,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Wrap(
                            spacing: 14.0,
                            children: popularCuisines.map((searchItem) {
                              return Container(
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
                                      title: searchItem,
                                      titleColor: Colors.green,
                                      fontSize: AppFontWeight.font13,
                                      fontWeight: FontWeight.w700,
                                      textoverflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      title: 'All Cuisines',
                      fontSize: AppFontWeight.font17,
                      fontWeight: FontWeight.bold,
                      titleColor: AppColor.blackColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: /*itemcount<1 ?? 0 :*/ 150,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Wrap(
                            spacing: 14.0,
                            children: allCuisines.map((searchItem) {
                              return Container(
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
                                      title: searchItem,
                                      titleColor: Colors.green,
                                      fontSize: AppFontWeight.font13,
                                      fontWeight: FontWeight.w700,
                                      textoverflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
